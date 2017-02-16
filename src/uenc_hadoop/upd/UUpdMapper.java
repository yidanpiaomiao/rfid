package uenc_hadoop.upd;

import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reporter;

import uenc_cpabe.UpdatableEncryption;

public class UUpdMapper extends MapReduceBase implements
	Mapper<BytesWritable, BytesWritable, BytesWritable, BytesWritable> {
	
	public static int numofAttr;
	public static int policyType;
	public static String outputPath;
	public static BytesWritable rkBytes;
	
	public void configure(JobConf job) {
		numofAttr = Integer.parseInt(job.get("numofAttr"));
		policyType = Integer.parseInt(job.get("policyType"));
		outputPath = job.get("outputPath");
		try {
			rkBytes = DefaultStringifier.load(job, "rkBytes", BytesWritable.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void map(BytesWritable key, BytesWritable value,
			OutputCollector<BytesWritable, BytesWritable> collector, Reporter reporter)
			throws IOException {
		
		UpdatableEncryption uenc = new UpdatableEncryption();

		try {
			rkBytes.setCapacity(rkBytes.getLength());
			value.setCapacity(value.getLength());
			collector.collect(key, new BytesWritable(uenc.uEncUpdate(rkBytes.getBytes(), value.getBytes())));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

}
