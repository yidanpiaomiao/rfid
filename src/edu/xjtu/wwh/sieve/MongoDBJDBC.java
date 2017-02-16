package edu.xjtu.wwh.sieve;

import java.util.ArrayList;
import org.bson.types.Binary;
import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

/**
 * This class is intended to provide API for MongoDB operation
 * @author still
 *
 */
public class MongoDBJDBC {
	private String server;
	private String username;
	private String databaseName;
	private String password;
	private MongoClient mongoClient;
	
	public MongoDBJDBC(String server,String username,String databaseName,String password){
		this.server=server;
		this.username=username;
		this.databaseName=databaseName;
		this.password=password;
	}
	
	private MongoDatabase getDatabaseUsingAuth(){
		MongoDatabase mongoDatabase=null;
		 try {  
	            //连接到MongoDB服务 如果是远程连接可以替换“localhost”为服务器所在IP地址  
	            //ServerAddress()两个参数分别为 服务器地址 和 端口  
	            ServerAddress serverAddress = new ServerAddress(server,27017);  
	            List<ServerAddress> addrs = new ArrayList<ServerAddress>();  
	            addrs.add(serverAddress);  
	              
	            //MongoCredential.createScramSha1Credential()三个参数分别为 用户名 数据库名称 密码  
	            MongoCredential credential = MongoCredential.createScramSha1Credential(username, databaseName, password.toCharArray());  
	            List<MongoCredential> credentials = new ArrayList<MongoCredential>();  
	            credentials.add(credential);  
	            
	            //通过连接认证获取MongoDB连接  
	            mongoClient = new MongoClient(addrs,credentials);  
	            //连接到数据库 
	            mongoDatabase = mongoClient.getDatabase(databaseName);
	            System.out.println("Connect to database successfully");  
	        } catch (Exception e) {  
	            System.err.println( e.getClass().getName() + ": " + e.getMessage() ); 
	        }
		return mongoDatabase;  
	}
	
	private MongoDatabase getDatabase(){
		MongoDatabase mongoDatabase=null;
		 try {  
	            //连接到MongoDB服务 如果是远程连接可以替换“localhost”为服务器所在IP地址  
	            //ServerAddress()两个参数分别为 服务器地址 和 端口  
	            ServerAddress serverAddress = new ServerAddress(server,27017);  
	            List<ServerAddress> addrs = new ArrayList<ServerAddress>();  
	            addrs.add(serverAddress);  
	              
	            //通过连接认证获取MongoDB连接  
	            mongoClient = new MongoClient(addrs);  
	            //连接到数据库 
	            mongoDatabase = mongoClient.getDatabase(databaseName);
	            System.out.println("Connect to database successfully");  
	        } catch (Exception e) {  
	            System.err.println( e.getClass().getName() + ": " + e.getMessage() ); 
	        }
		return mongoDatabase;  
	}
	public void createCollection(String collectionName){
		MongoDatabase db=getDatabase();
		db.createCollection(collectionName);
	    System.out.println("集合创建成功");
	}
	
	public MongoCollection<Document> getCollection(String collectionName){
		MongoDatabase db=getDatabase();
		return db.getCollection(collectionName);
	}
	
	public void  insertDocument(String collectionName, Map<String,Object> map){
		MongoCollection<Document> collection=getCollection(collectionName);
	    Document doc=new Document(map);
	    collection.insertOne(doc); 
	    System.out.println("文档插入成功");
	}
	
	public void searchDocument(String collectionName){
		MongoCollection<Document> collection=getCollection(collectionName);
		FindIterable<Document> findIterable = collection.find();  
        MongoCursor<Document> mongoCursor = findIterable.iterator();  
        while(mongoCursor.hasNext()){  
           System.out.println(mongoCursor.next());  
        }  
	}
	
	//Not proper!!
	public byte[] findOne(String collectionName,String key,String filter){
		MongoCollection<Document> collection=getCollection(collectionName); 
		FindIterable<Document> findIterable = collection.find(Filters.eq(key,filter));
		MongoCursor<Document> mongoCursor = findIterable.iterator();  
	    while(mongoCursor.hasNext()){ 
	    	Binary rs=(Binary) mongoCursor.next().get("content");
	    	System.out.println("-------------------------");  
	    	System.err.println("mongo read record length"+rs.length());
	    	System.out.println("-------------------------");
	    	return rs.getData();
	    }  
	    return null;
	}
	
	public void updateDocument(String collectionName,String key,String filter, Object value){
		MongoCollection<Document> collection=getCollection(collectionName); 
        collection.updateMany(Filters.eq(key,filter), new Document("$set",new Document(key,value)));
	}
}
