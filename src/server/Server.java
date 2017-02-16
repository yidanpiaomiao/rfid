package server;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.DefaultStringifier;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.SequenceFileAsBinaryInputFormat;
import org.apache.hadoop.mapred.SequenceFileAsBinaryOutputFormat;

import edu.xjtu.wwh.core.OperHDFS;
import uenc_hadoop.enc.*;
import uenc_hadoop.dec.*;
import uenc_hadoop.upd.*;


public class Server extends Thread {

	public Socket sock;
	
	public static int port = 21599;
	public static final int MAX_BYTE_LEN = 32767;
	public static String serverFilePath = "Server_Data";
	
	public Server(Socket sock) {
		this.sock=sock;
	}
	
	public static String keyPath;
	public static String filePath;
		
	public void run() {
		
		try {
			
			OutputStream os = sock.getOutputStream();
			InputStream is = sock.getInputStream();
			
			byte[] tmpBytes = new byte[MAX_BYTE_LEN];
			int len=is.read(tmpBytes);
			
			String code = new String(tmpBytes, 0, len);
			
			//add by wwh
			System.err.println("wwh");
			
			System.out.println(code);
			
			if(code.substring(0, 3).compareTo(new String("enc")) == 0) {
				
				// enc file
				System.err.println("enc file");
				if(!isPathExists(serverFilePath)) {
					checkPath(serverFilePath);
				}
				
				String clientName = code.substring(3, 11);
				String fileName = code.substring(11, code.length());
				filePath = serverFilePath + File.separator + clientName;
				
				if(!isPathExists(filePath)) {
					checkPath(filePath);
				}
				String file = filePath + File.separator + fileName;
				long fileLen = 0;
				System.out.println("wwh: fileName="+file);
				
				os.write(new String("Server OK.").getBytes());
				
				String tmpStr="";
				do {
					
					//Read client infor
					tmpBytes = new byte[MAX_BYTE_LEN];
					len = is.read(tmpBytes);
					//add by wwh
					tmpStr=new String(tmpBytes, 0, len);
					System.err.println("wwh: tmpStr="+tmpStr);
					System.err.println("wwh: len="+len);
					
					if((tmpStr.compareTo(new String("end")) != 0)) {
						//add by wwh
						System.err.println("if condition");
						//writeLine(file, tmpStr);
						OperHDFS.writeToHDFS(tmpStr, file);
						
						fileLen += len;
						System.out.println(len + "/" + fileLen);
						os.write(new String("Get " + len + "/" + fileLen + " bytes.").getBytes());
					}				
					
				} while((tmpStr.compareTo(new String("end")) != 0));
				
				keyPath = filePath + File.separator + "key";
				
				encTask(file);
				
				os.write(new String("Enc success.").getBytes());
				
				os.close();
				is.close();

				sock.close();
			}
			
			else if(code.substring(0, 3).compareTo(new String("dec")) == 0) {
				
				// dec file
				
				String clientName = code.substring(3, 11);
				String fileName = code.substring(11, code.length());
				filePath = serverFilePath + File.separator + clientName;
				
				String file = filePath + File.separator + fileName;

				decTask(file);
				
				InputStream fin = new FileInputStream(filePath + File.separator + "output" + File.separator + "part-00000");
	            int fileLen = 0;
	            tmpBytes = new byte[MAX_BYTE_LEN];
	            
	            while ((fileLen = fin.read(tmpBytes)) != -1) {
	            	os.write(tmpBytes, 0, fileLen);
	            }
	            
	            os.write(new String("end").getBytes());
	            
	    		Configuration copyConf = new Configuration();
	    		FileSystem fs = FileSystem.get(copyConf);
	    		
	    		fs.delete(new Path(filePath + File.separator + "output"), true);
			}
			
			else if(code.substring(0, 3).compareTo(new String("upd")) == 0) {
				
				// update file
				
				String clientName = code.substring(3, 11);
				String fileName = code.substring(11, code.length());
				filePath = serverFilePath + File.separator + clientName;
				
				String file = filePath + File.separator + fileName;

				updTask(file);
				os.write(new String("Update success.").getBytes());
				
			}
			
		}
		catch(Exception e) {
			System.err.println(e.getMessage());
		}
		
	}
	
	public static void main(String[] args) {
		
		try {
			
			ServerSocket ss = new ServerSocket(port);
			System.out.println("Server started.");
			
			while(true) {
				Socket s = ss.accept();
				new Server(s).start();
				System.out.println("One ended.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void writeLine(String file, String line) {
		
		try {
			System.err.println("line!!!!"+line);
			File f = new File(file);
			if (!f.exists()) {
				f.createNewFile();
			}
			BufferedWriter output = new BufferedWriter(new FileWriter(f, true));
			output.append(line);
			output.flush();
			output.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static boolean isPathExists(String path)	{
		
		File f = new File(path);
		
		if(f.isDirectory())	{
			return true;
		}
		
		else {
			return false;
		}
		
	}
	
	public static void checkPath(String path) {
		
		File f = new File(path);
		if(!f.isDirectory()) {
			f.mkdir();
		}
		
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
	
	public static void encTask(String fileName) throws IOException {
		System.err.println("wwh: encTask start!!!");
		JobConf conf= new JobConf(UEnc.class);
		
		conf.setJobName("Updatable Encryption - Enc");
		FileInputFormat.addInputPath(conf, new Path(fileName));
		String outPath = filePath + File.separator + "output";
		
		FileOutputFormat.setOutputPath(conf, new Path(outPath));
		
		System.out.println("---------------------------------");
		System.out.println("Input Path="+fileName);
		System.out.println("Output Path="+outPath);
		System.out.println("---------------------------------");
		
		conf.setMapperClass(UEncMapper.class);
		conf.setOutputKeyClass(BytesWritable.class);
		conf.setOutputValueClass(BytesWritable.class);
		conf.setOutputFormat(SequenceFileAsBinaryOutputFormat.class);
		
		conf.set("numofAttr", "15");
		conf.set("policyType", "1");

		// 读取并存储pub,usk,ugp

		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "pub"), "pubBytes");
		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "usk"), "uskBytes");
		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "ugp"), "ugpBytes");
		//Add by wwh
		
		System.err.println("wwh: encTask run!!!");
		try{
			JobClient.runJob(conf);
		}catch(Exception e){
			System.err.println("wwh: ssssssssssssbbbbbbbbbbb!");
			e.printStackTrace();
		}
		
		Configuration copyConf = new Configuration();
		//FileSystem fs = FileSystem.get(copyConf);
		//fs.delete(new Path(fileName), false);
		//add by wwh
		Path dfs=new Path(fileName);
		FileSystem fs = dfs.getFileSystem(copyConf);
				
		InputStream in = null;
		OutputStream out = fs.create(new Path(fileName));
		try {
			in = fs.open(new Path(outPath + File.separator + "part-00000"));
			IOUtils.copyBytes(in, out, copyConf);
			
		}catch (Exception e){
			System.err.println("wwh: eeeeee");
			System.err.println("wwh: "+e.getMessage());
		}
		finally {	
			IOUtils.closeStream(in);
			IOUtils.closeStream(out);	
		}
		
		fs.delete(new Path(outPath), true);
		//Add by wwh
		System.err.println("wwh: encTask finish!!!");
	}
	
	public static void decTask(String fileName) throws IOException {
		
		JobConf conf = new JobConf(UDec.class);
		conf.setJobName("Updatable Encryption - Dec");
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		
		FileInputFormat.addInputPath(conf, new Path(fileName));
		String outPath = filePath + File.separator + "output";
		FileOutputFormat.setOutputPath(conf, new Path(outPath));
		conf.setMapperClass(UDecMapper.class);
		conf.setOutputKeyClass(Text.class);
		conf.setOutputValueClass(Text.class);
		
		conf.set("numofAttr", "15");
		conf.set("policyType", "1");
		
		// 读取并存储pub,usk,ugp

		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "pub"), "pubBytes");
		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "usk"), "uskBytes");
		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "prv"), "prvBytes");

		JobClient.runJob(conf);
		
	}
	
	public static void updTask(String fileName) throws IOException {
		
		JobConf conf = new JobConf(UUpd.class);
		conf.setJobName("Updatable Encryption - Update");
		
		FileInputFormat.addInputPath(conf, new Path(fileName));
		String outPath = filePath + File.separator + "output";
		FileOutputFormat.setOutputPath(conf, new Path(outPath));
		conf.setMapperClass(UUpdMapper.class);
		conf.setInputFormat(SequenceFileAsBinaryInputFormat.class);
		conf.setOutputKeyClass(BytesWritable.class);
		conf.setOutputValueClass(BytesWritable.class);
		conf.setOutputFormat(SequenceFileAsBinaryOutputFormat.class);
		
		conf.set("numofAttr", "15");
		conf.set("policyType", "1");
		
		// 读取并存储rk
		
		DefaultStringifier.store(conf, readFile(keyPath + File.separator + "rk"), "rkBytes");

		JobClient.runJob(conf);
		
		Configuration copyConf = new Configuration();
		//FileSystem fs = FileSystem.get(copyConf);
		//fs.delete(new Path(fileName), false);
		//add by wwh
		Path dfs=new Path(fileName);
		FileSystem fs = dfs.getFileSystem(copyConf);
		
		InputStream in = null;
		OutputStream out = fs.create(new Path(fileName));
		
		try {
			
			in = fs.open(new Path(outPath + File.separator + "part-00000"));
			IOUtils.copyBytes(in, out, copyConf);
			
		} finally {
			
			IOUtils.closeStream(in);
			IOUtils.closeStream(out);
			
		}
		
		fs.delete(new Path(outPath), true);
		
	}
	
}