package edu.xjtu.wwh.sieve;

import org.apache.hadoop.io.BytesWritable;

import edu.xjtu.wwh.parameter.DefaultParameter;

public class UserClientEntry {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserClient uc=new UserClient(DefaultParameter.TEST_CLIENT_ID);
		String sSrc="this is just a test/n hehhehe\n\n!";
		String sKey="1234567891234567";
		
		String cipher="";
		byte[] metaCipher=null;
		
		try {
			cipher=uc.encData(sSrc, sKey);
			System.out.println("cipher:"+cipher);
			System.out.println("plain:"+uc.decData(cipher, sKey));
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}
		//first
		String GUID=uc.uploadEncData(cipher);
		//second
		BytesWritable bw=uc.encMetadata(GUID, sKey);
		System.out.println("------------------------");
		System.out.println("Length"+bw.getLength());
		System.out.println("Capacity"+bw.getCapacity());
		System.out.println("------------------------");
		bw.setCapacity(bw.getLength());
		metaCipher=bw.getBytes();
		System.out.println("------------------------");
		System.out.println("byte[] metaCipher"+metaCipher.length);
		System.out.println("------------------------");
		
		uc.uploadEncMetadata(GUID, metaCipher);
	}

}
