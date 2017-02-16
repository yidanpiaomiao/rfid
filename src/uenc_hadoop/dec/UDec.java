package uenc_hadoop.dec;

import java.io.File;
import java.io.IOException;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.SequenceFileAsBinaryInputFormat;

public class UDec {

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
				System.out.println("udec [serverId] [numofAttr] [policyType] [inputPath] [outputPath]");
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
		
		JobConf conf = new JobConf(UDec.class);
		conf.setJobName("Updatable Encryption - Dec");
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		FileInputFormat.addInputPath(conf, new Path(inputPath));
		FileOutputFormat.setOutputPath(conf, new Path(outputPath));
		conf.setMapperClass(UDecMapper.class);
		conf.setOutputKeyClass(Text.class);
		conf.setOutputValueClass(Text.class);
		
		conf.set("numofAttr", numofAttr);
		conf.set("policyType", policyType);
		
		// 读取并存储pub,usk,prv

		DefaultStringifier.store(conf, readFile(keyFolderName + serverId + File.separator + "pub"), "pubBytes");
		DefaultStringifier.store(conf, readFile(keyFolderName + serverId + File.separator + "usk"), "uskBytes");
		DefaultStringifier.store(conf, readFile(keyFolderName + serverId + File.separator + "prv"), "prvBytes");

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
