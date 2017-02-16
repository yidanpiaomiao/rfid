package edu.xjtu.wwh.sieve;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.sleepycat.je.Cursor;
import com.sleepycat.je.CursorConfig;
import com.sleepycat.je.Database;
import com.sleepycat.je.DatabaseConfig;
import com.sleepycat.je.DatabaseEntry;
import com.sleepycat.je.Environment;
import com.sleepycat.je.EnvironmentConfig;
import com.sleepycat.je.LockConflictException;
import com.sleepycat.je.LockMode;
import com.sleepycat.je.OperationStatus;
import com.sleepycat.je.Transaction;
import com.sleepycat.je.TransactionConfig;

/**
 * Reference:http://blog.csdn.net/jediael_lu/article/details/27534223
 * This class is intended to provide API for BerkeleyDB operation
 * @author still
 *
 */
public class BerkeleyDBJDBC {
	// 数据库环境
	private Environment env = null;
	// 数据库
	private Database frontierDatabase = null;
	// 数据库名
	private String dbName = null;

	public BerkeleyDBJDBC(String homeDirectory) {
		// 1、创建EnvironmentConfig
		EnvironmentConfig envConfig = new EnvironmentConfig();
		envConfig.setTransactional(true);
		envConfig.setAllowCreate(true);
		
		// 2、使用EnvironmentConfig配置Environment
		env = new Environment(new File(homeDirectory), envConfig);
	}
	
	/**
	 * This function is intended to open targeted database
	 * @param dbName
	 * @return 
	 */
	public void openDB(String dbName){
		this.dbName=dbName;
		// 3、创建DatabaseConfig
		DatabaseConfig dbConfig = new DatabaseConfig();
		dbConfig.setTransactional(true);
		dbConfig.setAllowCreate(true);

		// 4、使用Environment与DatabaseConfig打开Database
		frontierDatabase = env.openDatabase(null, dbName, dbConfig);
	}
	
	/**
	 * This function is intended to list the names of database
	 */
	public List<String> getDBNames(){
		List<String>list=env.getDatabaseNames();
		Iterator< String> it=list.iterator();
		while(it.hasNext()){
			String name=it.next();
			System.out.print("DBname:"+name);
		}
		return list;
	}
	
	/**
	 * This function is intended to remove targeted database
	 * @param dbName
	 */
	public void removeDB(String dbName){
		env.removeDatabase(null,dbName);
	}
	
	/*
	 * 向数据库中写入记录，并判断是否可以有重复数据。 传入key和value
	 * 若可以有重复数据，则直接使用put()即可，若不能有重复数据，则使用putNoOverwrite()。
	 */
	public boolean writeToDatabase(String key, byte[] value, boolean isOverwrite) {
		// TODO Auto-generated method stub
		try {
			// 设置key/value,注意DatabaseEntry内使用的是bytes数组
			DatabaseEntry theKey = new DatabaseEntry(key.getBytes("UTF-8"));
			DatabaseEntry theData = new DatabaseEntry(value);
			OperationStatus status = null;
			Transaction txn = null;
			try {
				// 1、Transaction配置
				TransactionConfig txConfig = new TransactionConfig();
				txConfig.setSerializableIsolation(true);
				txn = env.beginTransaction(null, txConfig);
				// 2、写入数据
				if (isOverwrite) {
					status = frontierDatabase.put(txn, theKey, theData);
				} else {
					status = frontierDatabase.putNoOverwrite(txn, theKey, theData);
				}
				txn.commit();
				if (status == OperationStatus.SUCCESS) {
					System.out.println("向数据库" + dbName + "中写入:" + key + "," + value);
					return true;
				} else if (status == OperationStatus.KEYEXIST) {
					System.out.println("向数据库" + dbName + "中写入:" + key + "," + value + "失败,该值已经存在");
					return false;
				} else {
					System.out.println("向数据库" + dbName + "中写入:" + key + "," + value + "失败");
					return false;
				}
			} catch (LockConflictException lockConflict) {
				txn.abort();
				System.out.println("向数据库" + dbName + "中写入:" + key + "," + value + "出现lock异常");
				return false;
			}
		} catch (Exception e) {
			// 错误处理
			System.out.println("向数据库" + dbName + "中写入:" + key + "," + value + "出现错误");

			return false;
		}
	}
	/*
	 * 从数据库中读出数据 传入key 返回value
	 */
	public byte[] readFromDatabase(String key) {
		try {
			DatabaseEntry theKey = new DatabaseEntry(key.getBytes("UTF-8"));
			DatabaseEntry theData = new DatabaseEntry();
			Transaction txn = null;
			try {
				// 1、配置 Transaction相关信息
				TransactionConfig txConfig = new TransactionConfig();
				txConfig.setSerializableIsolation(true);
				txn = env.beginTransaction(null, txConfig);
				// 2、读取数据
				OperationStatus status = frontierDatabase.get(txn, theKey, theData, LockMode.DEFAULT);
				txn.commit();
				if (status == OperationStatus.SUCCESS) {
					// 3、将字节转换成String
					byte[] retData = theData.getData();
					String value = new String(retData, "UTF-8");
					System.out.println("从数据库" + dbName + "中读取:" + key + "," + value);
					return retData;
				} else {
					System.out.println("No record found for key '" + key + "'.");
					return null;
				}
			} catch (LockConflictException lockConflict) {
				txn.abort();
				System.out.println("从数据库" + dbName + "中读取:" + key + "出现lock异常");
				return null;
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();

			return null;
		}
	}

	/*
	 * 遍历数据库中的所有记录，返回list
	 */
	public LinkedList<String> getEveryItem() {
		// TODO Auto-generated method stub
		System.out.println("===========遍历数据库" + dbName + "中的所有数据==========");
		Cursor myCursor = null;
		LinkedList<String> resultList = new LinkedList<String>();
		Transaction txn = null;
		try {
			txn = this.env.beginTransaction(null, null);
			CursorConfig cc = new CursorConfig();
			cc.setReadCommitted(true);
			if (myCursor == null)
				myCursor = frontierDatabase.openCursor(txn, cc);
			DatabaseEntry foundKey = new DatabaseEntry();
			DatabaseEntry foundData = new DatabaseEntry();
			// 使用cursor.getPrev方法来遍历游标获取数据
			if (myCursor.getFirst(foundKey, foundData, LockMode.DEFAULT) == OperationStatus.SUCCESS) {
				String theKey = new String(foundKey.getData(), "UTF-8");
				String theData = new String(foundData.getData(), "UTF-8");
				resultList.add(theKey);
				System.out.println("Key | Data : " + theKey + " | " + theData + "");
				while (myCursor.getNext(foundKey, foundData, LockMode.DEFAULT) == OperationStatus.SUCCESS) {
					theKey = new String(foundKey.getData(), "UTF-8");
					theData = new String(foundData.getData(), "UTF-8");
					resultList.add(theKey);
					System.out.println("Key | Data : " + theKey + " | " + theData + "");
				}
			}
			myCursor.close();
			txn.commit();
			return resultList;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			System.out.println("getEveryItem处理出现异常");

			txn.abort();
			if (myCursor != null) {
				myCursor.close();
			}
			return null;
		}
	}

	/*
	 * 根据key值删除数据库中的一条记录
	 */
	public boolean deleteFromDatabase(String key) {
		boolean success = false;
		long sleepMillis = 0;
		for (int i = 0; i < 3; i++) {
			if (sleepMillis != 0) {
				try {
					Thread.sleep(sleepMillis);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
					sleepMillis = 0;
			}
			Transaction txn = null;
			try {
				// 1、使用cursor.getPrev方法来遍历游标获取数据
				TransactionConfig txConfig = new TransactionConfig();
				txConfig.setSerializableIsolation(true);
				txn = env.beginTransaction(null, txConfig);
				DatabaseEntry theKey;
				theKey = new DatabaseEntry(key.getBytes("UTF-8"));

				// 2、删除数据 并提交
				OperationStatus res = frontierDatabase.delete(txn, theKey);
				txn.commit();
				if (res == OperationStatus.SUCCESS) {
					System.out.println("从数据库" + dbName + "中删除:" + key);
					success = true;
					return success;
				} else if (res == OperationStatus.KEYEMPTY) {
					System.out.println("没有从数据库" + dbName + "中找到:" + key + "。无法删除");
				} else {
					System.out.println("删除操作失败，由于" + res.toString());
				}
				return false;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return false;
			} catch (LockConflictException lockConflict) {
				System.out.println("删除操作失败，出现lockConflict异常");
				sleepMillis = 1000;

				continue;
			} finally {
				if (!success) {
					if (txn != null) {
						txn.abort();
					}
				}
			}
		}
		return false;
	}

	public void closeDB() {
		if (frontierDatabase != null) {
			frontierDatabase.close();
		}
		if (env != null) {
			env.close();
		}
	}
}
