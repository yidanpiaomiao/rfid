package edu.xjtu.wwh.cs;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import edu.xjtu.wwh.core.CoreFunc;
import edu.xjtu.wwh.parameter.DefaultParameter;


public class Server extends Thread {
	
	private static int port=5666;
	@SuppressWarnings("unused")
	private Socket sock=null;
	private InputStream is=null;
	private OutputStream os=null;
	private final int BUFFER_SIZE=32767;
	
	private String base = DefaultParameter.BASE;
	private String clientID=null;
	private String serverFileName=null;
	
	public Server(Socket sock) {
		this.sock=sock;
		try {
			is=sock.getInputStream();
			os=sock.getOutputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	private void encHandle(){
		String tmpStr=null;
		byte[] tmpBytes=null;
		int len=0;
		int fileLen=0;
		String revStr="";
		
		//Write server reply
		try {
			os.write(new String("Server OK.").getBytes());
				
			//Read file content
			tmpBytes = new byte[BUFFER_SIZE];
			while((len=is.read(tmpBytes))>0 && !new String(tmpBytes,0,len).equals("EOS")){
				tmpStr=new String(tmpBytes, 0, len);
				revStr+=tmpStr;
				fileLen += len;
				//Send server reply
				os.write(new String("Get " + len + "/" + fileLen + " bytes.").getBytes());	
			}
			CoreFunc cf=new CoreFunc(serverFileName, base,clientID);
			cf.encFunc(revStr);
			os.write("\nSucess enc!".getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			try {
				os.write(("\nFail enc!"+e.getMessage()).getBytes());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}	
	}
	
	private void decHandle(){
		CoreFunc cf=new CoreFunc(serverFileName, base,clientID);
		String result=null;
		byte[] tmp=new byte[BUFFER_SIZE];
		int off=0;
		try {
			result=cf.decFunc();
			byte[] resultByte=result.getBytes();
			for(int i=0;i<resultByte.length/BUFFER_SIZE;i++){
				os.write(resultByte, off, BUFFER_SIZE);
				off+=BUFFER_SIZE;
				//Receive reply info
				is.read(tmp);
			}
			//Write the last bytes array
			os.write(resultByte,off,resultByte.length%BUFFER_SIZE);
			is.read(tmp);
			
			//Write EOS
			os.write("EOS".getBytes());
			os.write("\nSuccess dec!".getBytes());
		} catch (IOException e) {
			try {
				os.write(("\nFail dec!"+e.getMessage()).getBytes());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void updHandle(){
		CoreFunc cf=new CoreFunc(serverFileName, base,clientID);
		try {
			cf.updFunc();
			os.write("\nSuccess upd!".getBytes());
		} catch (IOException e) {
			try {
				os.write(("\nFail upd!"+e.getMessage()).getBytes());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		try {
			while(true){
				//Receive client operation information
				byte[] tmpBytes = new byte[BUFFER_SIZE];
				int len=is.read(tmpBytes);	
				String code = new String(tmpBytes, 0, len);
				
				//Get operation type and choose different reply
				String[] str=code.split(":");
				String type=str[0];
				clientID=str[1];
				serverFileName=str[2];
				
				switch (type) {
					case "enc":
						encHandle();
						break;
					case "dec":
						decHandle();
						break;
					case "upd":
						updHandle();
						break;
					default:
						break;
				}
			}
		}
		catch(Exception e) {
			System.err.println(e.getMessage());
		}
		
	}
	
	public static void main(String[] args) {
		
		try {
			
			@SuppressWarnings("resource")
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
}