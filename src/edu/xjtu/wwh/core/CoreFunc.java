package edu.xjtu.wwh.core;

import java.io.File;
import java.io.IOException;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.SequenceFileAsBinaryInputFormat;
import org.apache.hadoop.mapred.SequenceFileAsBinaryOutputFormat;

import edu.xjtu.wwh.parameter.DefaultParameter;
import uenc_hadoop.dec.UDecMapper;
import uenc_hadoop.enc.UEncMapper;
import uenc_hadoop.upd.UUpdMapper;

public class CoreFunc {
	//
	public String cipherPath="cipher";
	public String plainPath="plain";
	
	/*
	 * ACT parameters definition
	 */
	public String numofAttr=DefaultParameter.TEST_numofAttr;
	public String policyType=DefaultParameter.TEST_policyType;
	
	public String serverFileName=null; /* Server file name */
	
	/*
	 * clientID is essential to indicates whose data is handled.
	 */
	public String clientID=null;
	
	/*
	 * rootPath means the root path of client data
	 * rootPath="base/"+clientID;
	 */
	public String rootPath=null; /* ServerData/client01 */
			
	/* darkPath contains the original content 
	 * It is illegal to preserve them in host
	 */
	public String darkPath=null; /* ServerData/client01/darkPath/test.txt */
	
	/*
	 * outPath means the output path of a MapReduce job
	 * You should better to delete it after finishing a job
	 * So realOutPath is intended to store the results
	 */
	public String outPath=null;/* ServerData/client01/output */
	public String realOutPath=null;/* ServerData/client01/realOutput */
	
	/*
	 * keyPath means the related keys' path
	 */
	public String keyPath=null;/* ServerData/client01/key */
	
	public CoreFunc(String serverFileName,String base,String clientID){
		this.serverFileName=serverFileName;
		this.clientID=clientID;
		this.rootPath=base+"/"+clientID;
		
		this.darkPath=rootPath+"/dark/"+serverFileName;
		this.outPath=rootPath+"/output";
		this.realOutPath=rootPath+"/out/"+serverFileName;
		this.keyPath=rootPath+"/key";
	}
	
	
	public BytesWritable encFunc(String revStr) throws IOException{
		OperHDFS.writeToHDFS(revStr, darkPath);
		JobConf conf= new JobConf();
		conf.setJobName("Updatable Encryption - Enc");
		//add by wwh
		conf.set("clientID", clientID);
		FileInputFormat.addInputPath(conf, new Path(darkPath));
		FileOutputFormat.setOutputPath(conf, new Path(outPath));	
		conf.setMapperClass(UEncMapper.class);
		conf.setOutputKeyClass(BytesWritable.class);
		conf.setOutputValueClass(BytesWritable.class);
		conf.setOutputFormat(SequenceFileAsBinaryOutputFormat.class);
		conf.set("numofAttr", numofAttr);
		conf.set("policyType", policyType);
		// 读取并存储pub,usk,ugp
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "pub"), "pubBytes");
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "usk"), "uskBytes");
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "ugp"), "ugpBytes");
		JobClient.runJob(conf);
		//Store the result into realOutPath
		OperHDFS.copyBytes(outPath + File.separator + "part-00000", realOutPath);
		OperHDFS.deleteFileOrDir(outPath);
		//add by wwh
		BytesWritable bw=OperHDFS.readFromHDFS(realOutPath);
		//Testhahah
		System.out.println("---------------------------------------");
		System.out.println("---------------------------------------");
		System.out.println("----"+new String(decFuncTest(bw.getBytes()).getBytes()));
		System.out.println("---------------------------------------");
		System.out.println("---------------------------------------");
		
		return bw;
	}
	
	public String decFunc() throws IOException {
		JobConf conf = new JobConf();
		conf.setJobName("Updatable Encryption - Dec");
		//add by wwh
		conf.set("clientID", clientID);
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		FileInputFormat.addInputPath(conf,new Path(realOutPath) );
		FileOutputFormat.setOutputPath(conf, new Path(outPath));
		conf.setMapperClass(UDecMapper.class);
		conf.setOutputKeyClass(Text.class);
		conf.setOutputValueClass(Text.class);
		conf.set("numofAttr", numofAttr);
		conf.set("policyType", policyType);
		// 读取并存储pub,usk,ugp
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "pub"), "pubBytes");
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "usk"), "uskBytes");
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "prv"), "prvBytes");
		JobClient.runJob(conf);
		BytesWritable bw=OperHDFS.readFromHDFS(outPath + File.separator + "part-00000");
		//Delete the outPath and all of it's contents
		OperHDFS.deleteFileOrDir(outPath);
		return new String(bw.getBytes());
	}
	
	public BytesWritable decFuncTest(byte[] cipher) throws IOException {
		//Store cipher in HDFS
		OperHDFS.writeToHDFS(cipher, cipherPath);
		
		JobConf conf = new JobConf();
		conf.setJobName("Updatable Encryption - GG");
		//add by wwh
		conf.set("clientID", clientID);
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		FileInputFormat.addInputPath(conf,new Path(cipherPath) );
		FileOutputFormat.setOutputPath(conf, new Path(plainPath));
		conf.setMapperClass(UDecMapper.class);
		conf.setOutputKeyClass(Text.class);
		conf.setOutputValueClass(Text.class);
		conf.set("numofAttr", numofAttr);
		conf.set("policyType", policyType);
		// 读取并存储pub,usk,ugp
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "pub"), "pubBytes");
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "usk"), "uskBytes");
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "prv"), "prvBytes");
		JobClient.runJob(conf);
		BytesWritable bw=OperHDFS.readFromHDFS(plainPath + File.separator + "part-00000");
		//Delete the outPath and all of it's contents
		OperHDFS.deleteFileOrDir(plainPath);
		bw.setCapacity(bw.getLength()-2);
		return bw;
	}
	public void updFunc() throws IOException {
		JobConf conf = new JobConf();
		conf.setJobName("Updatable Encryption - Update");
		//add by wwh
		conf.set("clientID", clientID);
		FileInputFormat.addInputPath(conf, new Path(realOutPath));
		FileOutputFormat.setOutputPath(conf, new Path(outPath));
		conf.setMapperClass(UUpdMapper.class);
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		conf.setOutputKeyClass(BytesWritable.class);
		conf.setOutputValueClass(BytesWritable.class);
		conf.setOutputFormat(SequenceFileAsBinaryOutputFormat.class);
		conf.set("numofAttr", numofAttr);
		conf.set("policyType", policyType);
		// 读取并存储rk
		DefaultStringifier.store(conf, OperHDFS.readFromHDFS(keyPath + File.separator + "rk"), "rkBytes");
		JobClient.runJob(conf);
		OperHDFS.copyBytes(outPath + File.separator + "part-00000", realOutPath);
		OperHDFS.deleteFileOrDir(outPath);
	}
}
