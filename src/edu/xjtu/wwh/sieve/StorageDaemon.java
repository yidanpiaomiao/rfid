package edu.xjtu.wwh.sieve;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import edu.xjtu.wwh.core.OperHDFS;

/**
 * This class is intended to represent Sieve import daemon
 * 
 * The main functions include "receive ABE-encrypted data and store it in database "
 * (UserClient class)
 * 
 * AND "push encrypted data to web service "
 * (ImportDaemon class)
 * 
 * @author still
 *
 */
public class StorageDaemon {
	private BerkeleyDBJDBC b;
	private MongoDBJDBC m;
	
	public StorageDaemon(){
		b=new BerkeleyDBJDBC("/home/still/berkeleyDB");
		m=new MongoDBJDBC("127.0.0.1", "wangweihua", "test", "123456");
	}
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
////		MongoDBJDBC m=new MongoDBJDBC("127.0.0.1", "wangweihua", "test", "123456");
////		//m.createCollection("nimei");
////		Map<String,Object> map=new HashMap<String,Object>();
////		map.put("GUID","123456");
////		map.put("ADE-enc", "###################");
////		m.insertDocument("aaa", map);
////		m.searchDocument("aaa");
////		
////		m.updateDocument("aaa", "GUID", "123456", "haha");
////		m.searchDocument("aaa");
//		
////		BerkeleyDBJDBC b=new BerkeleyDBJDBC("/home/still/berkeleyDB");
////		b.openDB("test");
////		 for (int i = 0; i < 10; i++){  
////		        b.writeToDatabase(i+"", "学生"+i, true);  
////		        }  
////		 
////		 String value = b.readFromDatabase("2"); 
////		 System.out.println("value="+value);
////		 
////		 int size = b.getEveryItem().size(); 
////		 System.out.println("size="+size);
////		 
////		 b.deleteFromDatabase("4");  
////		 System.out.println("size="+b.getEveryItem().size());
////		 
////		 b.closeDB();  
//		
////		BerkeleyDBJDBC b=new BerkeleyDBJDBC("/home/still/berkeleyDB");
////		b.openDB("Second");
////		b.openDB("Second");
////		b.writeToDatabase("wangweihua", "YES", true);
////		b.deleteFromDatabase("wangweihua");
////		b.getDBNames();
//	}
	
	/**
	 * This function is intended to receive encrypted data and should not be called directly.
	 * But it is called in UserClient
	 * @param cipher
	 * @return GUID
	 */
	public String receiveEncData(String cipher){
		String GUID=UUID.randomUUID().toString();
		//Store data in BerkelyDB
		b.openDB("test");
		b.writeToDatabase(GUID, cipher.getBytes(), true);
		b.closeDB();
		//Store GUID in HDFS
		OperHDFS.writeToHDFS(GUID, "GUID");
		//Response GUID
		return GUID;
	}
	
	/**
	 * This function is intended to receive encrypted metadata and should not be called directly.
	 * But it is called in UserClient
	 * @param GUID ,metaCipher
	 * @return
	 */
	public void receiveEncMetadata(String GUID,byte[] metaCipher) {
		// TODO Auto-generated method stub
		//Store metadata in MongoDB
		//m.createCollection("test");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("GUID", GUID);
		map.put("content", metaCipher);
		m.insertDocument("test", map);
		
		//test
		m.findOne("test", "GUID", GUID);
	}

	/**
	 * This function is intended to push encrypted data to third party and should not be called directly.
	 * But it is called in ImportDaemon
	 * @param GUID
	 * @return rs
	 */
	public String pushEncData(String GUID){
		b.openDB("test");
		String rs= b.readFromDatabase(GUID).toString();
		b.closeDB();
		return rs;
	}
	
	/**
	 * This function is intended to push encrypted metadata to third party and should not be called directly.
	 * But it is called in ImportDaemon
	 * @param GUID
	 * @return rs
	 */
	public byte[] pushEncMetadata(String GUID){
		return m.findOne("test", "GUID", GUID);
	}
}
