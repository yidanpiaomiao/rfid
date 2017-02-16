package cpabe;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class Common {

	/* read byte[] from inputfile */
	
	public static byte[] suckFile(String inputfile) throws Exception {
		
		Configuration conf = new Configuration(); 
		//??
        conf.set("hadoop.job.ugi", "hadoop-user,hadoop-user");
        
        // System.out.println(inputfile);
        
        FileSystem fs = FileSystem.get(URI.create(inputfile),conf); 
        FSDataInputStream in = null; 
        
        try {
        	
            in = fs.open( new Path(inputfile) );
            int size = in.available();
            byte[] content = new byte[size];
            in.read(content);
            
            in.close();
            
            return content;
            
        } finally { 
            in.close();
        } 
	}

	/* write byte[] into outputfile */
	public static void spitFile(String outputfile, byte[] b) throws Exception {
		
		Configuration conf = new Configuration(); 
        conf.set("hadoop.job.ugi", "hadoop-user,hadoop-user"); 
         
        FileSystem fs = FileSystem.get(URI.create(outputfile),conf);
        FSDataOutputStream out = null;
        try{ 
        	out = fs.create(new Path(outputfile));
        	out.write(b);
        	out.close();
            
        }finally{ 
            out.close();
        } 
	}


	public static byte[] combineCpabeBytes(byte[] cphBuf, byte[] aesBuf) throws Exception {
		
		byte[] combined = new byte[cphBuf.length + aesBuf.length + 8];
		int p = 0;
		
        combined[p + 3] = (byte) (aesBuf.length & 0xFF);  
        combined[p + 2] = (byte) (aesBuf.length >> 8 & 0xFF);  
        combined[p + 1] = (byte) (aesBuf.length >> 16 & 0xFF);  
        combined[p] = (byte) (aesBuf.length >> 24 & 0xFF); 
        
        p += 4;
        
		for(int i=0; i<aesBuf.length; i++) {
			combined[p++] = aesBuf[i];
		}

		combined[p + 3] = (byte) (cphBuf.length & 0xFF);  
        combined[p + 2] = (byte) (cphBuf.length >> 8 & 0xFF);  
        combined[p + 1] = (byte) (cphBuf.length >> 16 & 0xFF);  
        combined[p + 0] = (byte) (cphBuf.length >> 24 & 0xFF);
        
        p += 4;
		
		for(int i=0; i<cphBuf.length; i++) {
			combined[p++] = cphBuf[i];
		}
		
		System.out.println("Aes: "+aesBuf.length+"\tCph: "+cphBuf.length);

		return combined;
	}

	public static byte[][] splitCpabeBytes(byte[] splitted) throws Exception {
		
		int len;
		int p = 0;
		byte[][] res = new byte[2][];
		byte[] aesBuf, cphBuf;

        int b0 = splitted[p] & 0xFF;  
        int b1 = splitted[p + 1] & 0xFF;  
        int b2 = splitted[p + 2] & 0xFF;  
        int b3 = splitted[p + 3] & 0xFF;  
        p += 4;
        len = (b0 << 24) | (b1 << 16) | (b2 << 8) | b3; 
        
        aesBuf = new byte[len];
		for(int i=0; i<len; i++) {
			aesBuf[i] = splitted[p++];
		}

		b0 = splitted[p] & 0xFF;  
        b1 = splitted[p + 1] & 0xFF;  
        b2 = splitted[p + 2] & 0xFF;  
        b3 = splitted[p + 3] & 0xFF;
        p += 4;
        len = (b0 << 24) | (b1 << 16) | (b2 << 8) | b3;
        
        cphBuf = new byte[len];
		for(int i=0; i<len; i++) {
			cphBuf[i] = splitted[p++];
		}

		res[0] = aesBuf;
		res[1] = cphBuf;
		
		return res;
	}
}
