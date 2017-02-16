package edu.xjtu.wwh.rmi;

import java.io.File;
import java.io.IOException;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import cpabe.Cpabe;
import edu.xjtu.wwh.core.OperHDFS;
import edu.xjtu.wwh.parameter.DefaultParameter;
import uenc_application.CpabeTestStringBuilder;
import uenc_cpabe.UpdatableEncryption;
import uenc_hadoop.dec.UDecMapper;
import uenc_hadoop.enc.UEncMapper;
import uenc_hadoop.upd.UUpdMapper;

public class CoreFuncImp  extends UnicastRemoteObject implements CoreFunc{
	private static final long serialVersionUID = 1L;
	
	/*
	 * ACT parameters definition
	 */
	public String numofAttr=DefaultParameter.TEST_numofAttr;
	public String policyType=DefaultParameter.TEST_policyType;
	
	/*
	 * clientID is essential to indicates whose data is handled.
	 */
	public String clientID=null;
	
	/*
	 * rootPath means the root path of client data
	 * rootPath="base/"+clientID;
	 */
	public String rootPath=null; 
	
	/*
	 * outPath means the output path of a MapReduce job
	 * You should better to delete it after finishing a job
	 * So realOutPath is intended to store the results
	 */
	public String cipherPath=null;
	public String plainPath=null;
	
	/*
	 * keyPath means the related keys' path
	 */
	public String keyPath=null;
	
	public CoreFuncImp() throws RemoteException{
		
	}
	
	@Override
	public void init(String base,String clientID)throws RemoteException{
		this.clientID=clientID;
		this.rootPath=base+"/"+clientID;
		this.cipherPath=rootPath+"/cipher";
		this.plainPath=rootPath+"/plain";
		this.keyPath=rootPath+"/key";	
	}
	
	@Override
	public byte[] encFunc(byte[] plain) throws IOException{
		String uuid=UUID.randomUUID().toString();
		String filePath=plainPath+"/"+uuid;
		OperHDFS.writeToHDFS(plain, filePath);
		JobConf conf= new JobConf();
		conf.setJobName("Updatable Encryption - Enc");
		//add by wwh
		conf.set("clientID", clientID);
		FileInputFormat.addInputPath(conf, new Path(filePath));
		FileOutputFormat.setOutputPath(conf, new Path(cipherPath));	
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
		//add by wwh
		BytesWritable bw=OperHDFS.readFromHDFS(cipherPath + File.separator + "part-00000");
		cleanDir();
		return bw.getBytes();
	}
	
	@Override
	public byte[] decFunc(byte[] cipher) throws IOException {
		String uuid=UUID.randomUUID().toString();
		String filePath=cipherPath+"/"+uuid;
		OperHDFS.writeToHDFS(cipher, filePath);	
		JobConf conf = new JobConf();
		conf.setJobName("Updatable Encryption - GG");
		//add by wwh
		conf.set("clientID", clientID);
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		FileInputFormat.addInputPath(conf,new Path(filePath) );
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
		//Caution!!
		//bw.setCapacity(bw.getLength()-2);
		cleanDir();
		return bw.getBytes();
	}
	
	@Override
	public byte[] updFunc(byte[] oldCipher) throws IOException {
		String uuid=UUID.randomUUID().toString();
		String filePath=cipherPath+"/"+uuid;
		OperHDFS.writeToHDFS(oldCipher, filePath);	
		JobConf conf = new JobConf();
		conf.setJobName("Updatable Encryption - Update");
		//add by wwh
		conf.set("clientID", clientID);
		FileInputFormat.addInputPath(conf, new Path(filePath));
		FileOutputFormat.setOutputPath(conf, new Path(plainPath));
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
		BytesWritable bw=OperHDFS.readFromHDFS(plainPath+ File.separator + "part-00000");
		cleanDir();
		return bw.getBytes();
	}

	@Override
	public boolean cleanDir() throws RemoteException {
		// TODO Auto-generated method stub
		OperHDFS.deleteFileOrDir(cipherPath);
		OperHDFS.deleteFileOrDir(plainPath);
		return !OperHDFS.fileExists(plainPath) && !OperHDFS.fileExists(cipherPath);
	}
	
	@Override 
	public boolean encSetup()throws RemoteException{
		String keyPath=DefaultParameter.BASE+"/"+clientID+"/key";
		Cpabe cpabe = new Cpabe();
		String pubfile = keyPath + "/pub";
		String mskfile = keyPath + "/msk";
		try {
			cpabe.setup(pubfile, mskfile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		UpdatableEncryption ue = new UpdatableEncryption();
		String ugpFile = keyPath + "/ugp";
		String xFile = keyPath + "/x";
		String uskFile = keyPath + "/usk";
		try {
			ue.uSetup(ugpFile, xFile);
			ue.uKeygen(ugpFile, xFile, uskFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public boolean keyInitial(String attr_str) throws RemoteException {
		// TODO Auto-generated method stub
		
		boolean flag=checkAttrFormat(attr_str);
		if(!flag){
			return false;
		}else{
			String keyPath=DefaultParameter.BASE+"/"+clientID+"/key";
			Cpabe cpabe = new Cpabe();
			String pubfile = keyPath + "/pub";
			String mskfile = keyPath + "/msk";
			String prvfile = keyPath + "/prv";
			try {
				//store prv
				cpabe.keygen(pubfile, prvfile, mskfile, attr_str);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			return true;
		}
	}

	/**
	 * This function is intended to check whether an att_str is illegal.
	 * attr_str is like "attr1:obj attr2:obj",
	 * (the blank is important and can not be ignored).
	 * @return boolean
	 */
	private boolean checkAttrFormat(String attr_str) {
		if(attr_str==null)
			return false;
		else {
			String regex="((\\w)+:(\\w)+ )*((\\w)+:(\\w)+)";
			Pattern r=Pattern.compile(regex);
			Matcher m=r.matcher(attr_str);
			if(m.matches()){
				return true;
			}else{
				return false;
			}
		}
	}

	@Override
	public boolean uploadACT(String ACT_str) throws RemoteException {
		// TODO Auto-generated method stub
		if(checkAttrFormat(ACT_str)){
			CpabeTestStringBuilder.storeACTAttr(ACT_str,clientID);
			return true;
		}
		return false;
	}

	/**
	 * This function is intended to generate newusk file and replace old usk
	 * file
	 * 
	 * @return boolean whether the function works well
	 * 
	 */
	@Override
	public boolean updateKey() throws RemoteException {
		// TODO Auto-generated method stub

		UpdatableEncryption ue = new UpdatableEncryption();
		String uskFile = keyPath + "/usk";
		String newUskFile = keyPath + "/newusk";
		String rkFile = keyPath + "/rk";
		try {
			ue.uKeyUpdate(uskFile, newUskFile, rkFile);
			// Here delete old usk file and replace it with new usk file
			OperHDFS.deleteFileOrDir(uskFile);
			OperHDFS.copyBytes(newUskFile, uskFile);
			// Then it is proper to delete new usk file
			OperHDFS.deleteFileOrDir(newUskFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
