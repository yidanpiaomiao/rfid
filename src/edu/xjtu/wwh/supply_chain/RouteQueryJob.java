package edu.xjtu.wwh.supply_chain;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;
import org.apache.hadoop.mapred.TextInputFormat;

public class RouteQueryJob {
	public static class RouteMapper implements Mapper<LongWritable, Text, Text, Text>{

		/**
		 * Data from configure.
		 */
		private String queriedIdList=null;
		
		@Override
		public void map(LongWritable paramK1, Text paramV1, OutputCollector<Text, Text> paramOutputCollector,
				Reporter paramReporter) throws IOException {
			// TODO Auto-generated method stub
			String line=paramV1.toString();
			System.out.println(line);
			
			String[] rs=line.split(CriticalEvent.separator);
			String oid="";
			
			for(int i=0;i<rs.length;i++){
				if(rs[i].startsWith("obj=")){
					oid=rs[i].substring(4);
					if(queriedIdList.contains(oid)){
						paramOutputCollector.collect(new Text(oid),new Text(line));
						break;
					}else{
						continue;
					}
				}
				if(rs[i].startsWith("eventType=")){
					String tmp=rs[i].substring(10);
					if(tmp.equals("Assembled")||tmp.equals("Disassembled")){
						continue;
					}else{
						break;
					}
				}	
				if(rs[i].startsWith("child")||rs[i].startsWith("parent")){
					if(queriedIdList.contains(rs[i].substring(rs[i].length()-21))){
						paramOutputCollector.collect(new Text(oid),new Text(line));
						break;
					}
				}
			}
			
		}

		@Override
		public void configure(JobConf paramJobConf) {
			// TODO Auto-generated method stub
			queriedIdList=paramJobConf.get("queriedIdList");		
		}

		@Override
		public void close() throws IOException {
			// TODO Auto-generated method stub
			
		}
		
	}
	
	public static class RouteReducer implements Reducer<Text, Text, Text, Text>{

		@Override
		public void configure(JobConf jobConf) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void close() throws IOException {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void reduce(Text key, Iterator<Text> values, OutputCollector<Text, Text> collector,
				Reporter reporter) throws IOException {
			// TODO Auto-generated method stub
			int noValues = 0;
			while(values.hasNext()){
				String line="";
				String finalLine="";
				line=values.next().toString();
				noValues++;
				
				String[] rs=line.split(CriticalEvent.separator);
				String SE="$$$$$$";
				
				for(int i=0;i<rs.length;i++){
					if(rs[i].startsWith("timeStamp=")){
						String st=rs[i].substring(10);
						finalLine=st+SE;
						
					}	
					if(rs[i].startsWith("eventType=")){
						String et=rs[i].substring(10);
						finalLine+=et+SE;
						break;
					}	
				}
				System.out.println("line="+line);
				finalLine+=line;
				System.out.println("finalLine:"+finalLine);
				//Let the framework know that we are alive, and kicking!
				if ((noValues%10) == 0) {
		             reporter.progress();
		        }
				// Output the <key, value> 
		        collector.collect(key, new Text(finalLine));
			}
		}
	}
	
	public static void routeQuery(String clientID,String fileName,LinkedList<String> queriedIdList){
		// Create a new JobConf
		JobConf job = new JobConf(new Configuration(), RouteQueryJob.class);

		// Specify various job-specific parameters
		job.setJobName("Route Query");
		
		String in = clientID + "/" + fileName;
		String out = clientID + "/out";

		FileInputFormat.setInputPaths(job, new Path(in));
		FileOutputFormat.setOutputPath(job, new Path(out));

		job.setMapperClass(RouteQueryJob.RouteMapper.class);
		job.setReducerClass(RouteQueryJob.RouteReducer.class);

		job.setInputFormat(TextInputFormat.class);
		job.setMapOutputKeyClass(Text.class);  
	    job.setMapOutputValueClass(Text.class);  

		String rs = "";
		for (int i = 0; i < queriedIdList.size() - 1; i++) {
			rs += queriedIdList.get(i) + ",";
		}
		rs += queriedIdList.get(queriedIdList.size()-1);
		System.out.println(rs);
		job.set("queriedIdList", rs);
		
		 // Submit the job, then poll for progress until the job is complete
	     try {
			JobClient.runJob(job);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
