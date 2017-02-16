package edu.xjtu.wwh.supply_chain;

import edu.xjtu.wwh.core.OperHDFS;

public class FileTransAssist {
	public static String clientID="wangweihua";
	public static String fileName="data.txt";
	public static void uploadFile(){
		OperHDFS.copyLocalToHDFS(fileName, clientID+"/"+fileName);
	}
	public static void downloadResult(){
		OperHDFS.copyHDFSToLocal(clientID+"/out/part-00000", "result.txt");
	}
}
