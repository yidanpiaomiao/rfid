package edu.xjtu.wwh.sieve;

import org.apache.hadoop.io.BytesWritable;

import edu.xjtu.wwh.core.CoreFunc;
import edu.xjtu.wwh.core.OperHDFS;
import edu.xjtu.wwh.parameter.DefaultParameter;

/**
 * This class is intended to represent Sieve storage daemon
 * 
 * The main functions include "receive key from user client"
 * (UserClient class)
 * 
 * AND "pull encrypted data from storage provider and decrypt it locally and inject
 * the data into the unmodified application pipeline"
 * (StorageDaemon class)
 * 
 * @author still
 *
 */
public class ImportDaemon {
	private UserClient uc;
	private StorageDaemon sd;
	
	
	public ImportDaemon (String clientID){
		uc=new UserClient(clientID);
		sd=new StorageDaemon();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	/**
	 * This function is intended to receive ABEKey from UserClient.
	 */
	public void receiveKey(){
		uc.sendKey();
	}
	
	private String pullEncData(String GUID){
		return sd.pushEncData(GUID);
	}
	private byte[] pullEncMetadata(String GUID){
		return sd.pushEncMetadata(GUID);
	}
	public String getGUID(){
		return new String(OperHDFS.readFromHDFS("GUID").getBytes());
	}
	public void decryptData(String GUID){
		String data=pullEncData(GUID);
		byte[] metadata=pullEncMetadata(GUID);
		
		System.out.println("-----------------------------");
		System.out.println("data:"+data);
		System.out.println("metadata-length:"+metadata.length);
		System.out.println("metadata:"+metadata);
		System.out.println("-----------------------------");
		//Decrypte metadata
		String serverFileName="ignore";
		String base=DefaultParameter.BASE;
		String clientID=DefaultParameter.TEST_CLIENT_ID;
		CoreFunc cf=new CoreFunc(serverFileName,base,clientID);	
		try {
			BytesWritable bw=cf.decFuncTest(metadata);
			String metaplain=new String(bw.getBytes());
			System.out.println("metaplain--    "+metaplain);
			for(int i=0;i<metaplain.length();i++){
				System.out.println(i+"--"+metaplain.charAt(i)+"--");
			}
			System.out.println("datapalin"+uc.decData(data, metaplain));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public String injectDecData(String rs){
		return rs;
	}
}
