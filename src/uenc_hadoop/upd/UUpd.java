package uenc_hadoop.upd;

import java.io.File;
import java.io.IOException;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.SequenceFileAsBinaryInputFormat;
import org.apache.hadoop.mapred.SequenceFileAsBinaryOutputFormat;

import uenc_hadoop.enc.UEnc;
import uenc_hadoop.enc.UEncMapper;

public class UUpd {
	
	public static String serverId;		// Identify different server for finding there own keys
	public static String numofAttr;
	public static String policyType;
	public static String inputPath;
	public static String outputPath;
	
	public static String keyFolderName = "UKeys" + File.separator;
	
	public static void main(String[] args) throws IOException {
		
		if (args.length > 0) {
			if (args[0].equals("-h")) {
				System.out.println("Usage:");
				System.out.println("uupd [serverId] [numofAttr] [policyType] [inputPath] [outputPath]");
				System.exit(0);
			}

			if (args.length > 1) {
				serverId = args[0];
				numofAttr = args[1];
				policyType = args[2];
				inputPath = args[3];
				outputPath = args[4];
			}
		}
		
		JobConf conf = new JobConf(UUpd.class);
		conf.setJobName("Updatable Encryption - Update");
		FileInputFormat.addInputPath(conf, new Path(inputPath));
		FileOutputFormat.setOutputPath(conf, new Path(outputPath));
		conf.setMapperClass(UUpdMapper.class);
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		conf.setOutputKeyClass(BytesWritable.class);
		conf.setOutputValueClass(BytesWritable.class);
		conf.setOutputFormat(SequenceFileAsBinaryOutputFormat.class);
		
		conf.set("numofAttr", numofAttr);
		conf.set("policyType", policyType);
		
		// 读取并存储rk

		DefaultStringifier.store(conf, readFile(keyFolderName + serverId + File.separator + "rk"), "rkBytes");

		JobClient.runJob(conf);
		
	}
	
	public static BytesWritable readFile(String fileName) throws IOException {
		
		Configuration fileConf = new Configuration();
		byte[] b;
        FileSystem fs = FileSystem.get(URI.create(fileName), fileConf); 
        FSDataInputStream in = null; 
        try {
            in = fs.open(new Path(fileName));
            int size = in.available();
            b = new byte[size];
            in.read(b);
            in.close();
        } finally { 
            in.close();
        }
        BytesWritable pubBytes = new BytesWritable(b);
        return pubBytes;
		
	}
	
}
