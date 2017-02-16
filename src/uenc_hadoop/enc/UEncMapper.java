package uenc_hadoop.enc;

import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reporter;

import uenc_application.CpabeTestStringBuilder;
import uenc_cpabe.UpdatableEncryption;
import cpabe.Cpabe;

public class UEncMapper extends MapReduceBase implements Mapper<LongWritable, Text, BytesWritable, BytesWritable> {
	
	public static int numofAttr;
	public static int policyType;
	public static String outputPath;
	public static BytesWritable pubBytes, uskBytes, ugpBytes;
	public static String clientID;
	
	public void configure(JobConf job) {
		numofAttr = Integer.parseInt(job.get("numofAttr"));
		policyType = Integer.parseInt(job.get("policyType"));
		outputPath = job.get("outputPath");
		//add by wwh
		clientID=job.get("clientID");
		try {
			pubBytes = DefaultStringifier.load(job, "pubBytes", BytesWritable.class);
			uskBytes = DefaultStringifier.load(job, "uskBytes", BytesWritable.class);
			ugpBytes = DefaultStringifier.load(job, "ugpBytes", BytesWritable.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void map(LongWritable key, Text value,
			OutputCollector<BytesWritable, BytesWritable> collector, Reporter reporter)
			throws IOException {
		
		String attrString = CpabeTestStringBuilder.getAttributesString(numofAttr,clientID);
		String policy = CpabeTestStringBuilder.getPolicyString(numofAttr,
				attrString, policyType);
		//add by wwh
		System.out.println("policy string:"+policy);

		Cpabe cpabe = new Cpabe();
		UpdatableEncryption uenc = new UpdatableEncryption();
		
		String line = value.toString();
		String rfid = line.substring(0, 5);
		
		byte[] encByAbe;
		byte[] encByUenc;

		try {
			pubBytes.setCapacity(pubBytes.getLength());
			ugpBytes.setCapacity(ugpBytes.getLength());
			uskBytes.setCapacity(uskBytes.getLength());
			encByAbe = cpabe.enc(pubBytes.getBytes(), policy, line);
			encByUenc = uenc.uEncrypt(ugpBytes.getBytes(), uskBytes.getBytes(), encByAbe);
			collector.collect(new BytesWritable(rfid.getBytes()), new BytesWritable(encByUenc));
		} catch (Exception e) {
			System.out.println(e.toString());
		} 		
	}
}
