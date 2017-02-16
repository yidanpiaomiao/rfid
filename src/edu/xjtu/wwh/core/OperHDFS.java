package edu.xjtu.wwh.core;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.Arrays;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.IOUtils;
/**
 * Some method to operate the HDFS
 * Refer:http://blog.csdn.net/dandingyy/article/details/7434092
 * @author still
 */
public class OperHDFS {
	final static int BUFF_SIZE=4096;
	
	/**
	 * Check whether a file exists in HDFS
	 * @param filePath filePath
	 * @return Boolean
	 */
	public static boolean fileExists(String filePath){
		Configuration conf=new Configuration();
		FileSystem fs;
		try {
			fs = FileSystem.get(URI.create(filePath), conf);
			Path path = new Path(filePath); 
			return fs.exists(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public static void createFile(String filePath){
		Configuration conf=new Configuration();
		FileSystem fs;
		try {
			fs = FileSystem.get(URI.create(filePath), conf);
			Path path = new Path(filePath); 
			fs.createNewFile(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * Write values to HDFS file
	 * @param value value 
	 * @param filePath filePath
	 * @return Boolean
	 */
	public static boolean writeToHDFS(String value, String filePath){
		Configuration conf=new Configuration();
		FileSystem fs;
		FSDataOutputStream out = null;
		try {
			fs = FileSystem.get(URI.create(filePath), conf);
			Path path = new Path(filePath); 
			if(fs.exists(path)){
				fs.delete(path, true);
			}
			out = fs.create(path);   //创建文件
		    out.write(value.getBytes("UTF-8")); 
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}	
		return true;
	}	
	
	
	
	/**
	 * Append values to HDFS file
	 * @param value , filePath
	 * @return Boolean
	 */
	public static boolean appendToHDFS(String value, String filePath){
		Configuration conf=new Configuration();
		conf.setBoolean("dfs.support.append", true);
		FileSystem fs;
		try {
			fs = FileSystem.get(URI.create(filePath), conf);
			Path path = new Path(filePath); 
			
			FSDataOutputStream out=fs.append(path);
			InputStream in=new ByteArrayInputStream(value.getBytes("UTF-8"));
			IOUtils.copyBytes(in,out,BUFF_SIZE,true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}	
		return true;
	}	
	public static boolean appendToHDFS(byte[] value, String filePath){
		Configuration conf=new Configuration();
		conf.setBoolean("dfs.support.append", true);
		FileSystem fs;
		try {
			fs = FileSystem.get(URI.create(filePath), conf);
			Path path = new Path(filePath); 
			
			FSDataOutputStream out=fs.append(path);
			InputStream in=new ByteArrayInputStream(value);
			IOUtils.copyBytes(in,out,BUFF_SIZE,true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}	
		return true;
	}	
	/**
	 * Read bytes from HDFS file
	 * @param fileName fileName
	 * @return BytesWritable
	 */
	public static BytesWritable readFromHDFS(String fileName){
		Configuration fileConf = new Configuration();
		byte[] b = null;
        FileSystem fs;
        FSDataInputStream in = null; 
        try {
        	fs = FileSystem.get(URI.create(fileName), fileConf); 
            in = fs.open(new Path(fileName));
            int size = in.available();
            b = new byte[size];
            in.read(b);
            in.close();
        }catch( IOException e){
        	e.printStackTrace();
        }
        BytesWritable pubBytes = new BytesWritable(b);
        return pubBytes;	
	}
	
	/**
	 * This function is intended to delete target directory or file
	 * @param path path
	 * @return boolean
	 */
	public static boolean deleteFileOrDir(String path){
		try {
			FileSystem fs=FileSystem.get(URI.create(path), new Configuration());
			Path iPath =new Path(path);
			return fs.delete(iPath,true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;	
		}
	}
	
	/**
	 * This function is intended to copy bytes from source file to destination file
	 * If the destination file has existed, delete it first.
	 * @param src src
	 * @param des des
	 * @return Boolean
	 */
	public static Boolean copyBytes(String src, String des){
		try {
			Configuration conf=new Configuration();
			FileSystem fs=FileSystem.get(conf);
			Path isrc=new Path(src);
			Path ides=new Path(des);
			InputStream in=fs.open(isrc);
			FSDataOutputStream out=fs.create(ides, true);
			IOUtils.copyBytes(in, out, conf);
			IOUtils.closeStream(in);
			IOUtils.closeStream(out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	//NOT PROPER
	public static void writeToHDFS(byte[] value, String filePath) {
		// TODO Auto-generated method stub
		Configuration conf=new Configuration();
		FileSystem fs;
		FSDataOutputStream out = null;
		try {
			fs = FileSystem.get(URI.create(filePath), conf);
			Path path = new Path(filePath); 
			if(fs.exists(path)){
				fs.delete(path, true);
			}
			out = fs.create(path);   //创建文件
		    out.write(value); 
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	/**
	 * Copy local file into HDFS (String format).<br>
	 * File size can be large.
	 */
	public static boolean copyLocalToHDFS(String localPath,String HDFSPath){
		OperHDFS.createFile(HDFSPath);
		File file = new File(localPath);
		if (!file.exists()) {
			return false;
		}
		BufferedInputStream bis=null;
		try {
			bis = new BufferedInputStream(new FileInputStream(file));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		byte[] bys = new byte[BUFF_SIZE];
		int len = 0;
		try {
			while ((len = bis.read(bys)) != -1) {
				appendToHDFS(Arrays.copyOfRange(bys, 0, len),HDFSPath);	
			}
			bis.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * Copy local file into HDFS (String format).<br>
	 * File size only can be small.
	 */
	public static boolean copyHDFSToLocal(String HDFSPath,String localPath){
		File file = new File(localPath);
		if (file.exists()) {
			file.delete();
			try {
				file.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		BufferedOutputStream bos=null;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(file));
			bos.write(readFromHDFS(HDFSPath).getBytes());
			bos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
}

