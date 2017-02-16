package uenc_hadoop.dec;

import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reporter;

import uenc_cpabe.UpdatableEncryption;
import cpabe.Cpabe;

public class UDecMapper extends MapReduceBase implements Mapper<BytesWritable, BytesWritable, Text, Text> {
	
	public static int numofAttr;
	public static int policyType;
	public static String outputPath;
	public static BytesWritable pubBytes, uskBytes, prvBytes;
	
	public void configure(JobConf job) {
		numofAttr = Integer.parseInt(job.get("numofAttr"));
		policyType = Integer.parseInt(job.get("policyType"));
		outputPath = job.get("outputPath");
		System.out.println("outputpath-------------"+outputPath);
		try {
			pubBytes = DefaultStringifier.load(job, "pubBytes", BytesWritable.class);
			uskBytes = DefaultStringifier.load(job, "uskBytes", BytesWritable.class);
			prvBytes = DefaultStringifier.load(job, "prvBytes", BytesWritable.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void map(BytesWritable key, BytesWritable value,
			OutputCollector<Text, Text> collector, Reporter reporter)
			throws IOException {
				
		Cpabe cpabe = new Cpabe();
		UpdatableEncryption uenc = new UpdatableEncryption();
		
		byte[] decByAbe;
		byte[] decByUenc;

		try {
			pubBytes.setCapacity(pubBytes.getLength());
			prvBytes.setCapacity(prvBytes.getLength());
			uskBytes.setCapacity(uskBytes.getLength());
			value.setCapacity(value.getLength());
			
			decByUenc = uenc.uDecrypt(value.getBytes(), uskBytes.getBytes());
			
			decByAbe = cpabe.dec(pubBytes.getBytes(), prvBytes.getBytes(), decByUenc);
			
			if(decByAbe == null) {
				System.err.println("**Dec Failed!**");
			}
			else {
				collector.collect(new Text(new String(decByAbe)), new Text(""));
			}
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
