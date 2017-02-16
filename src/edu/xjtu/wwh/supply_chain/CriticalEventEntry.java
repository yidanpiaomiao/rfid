package edu.xjtu.wwh.supply_chain;

import java.util.LinkedList;

public class CriticalEventEntry {
	public static void main(String[] args){
//		CreateTestData.createData();
//		String queriedOid="7vM3ZCiFXj:zv3joZCIxr";
//		String filePath="data.txt";
//		System.out.println(Query.intimeQuery("data.txt", queriedOid));
//		List<String> list=Query.routeQuery(filePath, queriedOid);
//		for (String string : list) {
//			System.out.println(string);
//		}
//		System.out.println("done");
		
//		LinkedList<String>queriedIdList=new LinkedList<>();
//		queriedIdList.add("1jOVBBr1xJ:0Ts7mlvdUE");
//		queriedIdList.add("OX3jBPtEpV:29Qw64JENQ");
//		queriedIdList.add("bU2BnbN5aG:YuhLj7nkJe");
//		String clientID="wangweihua";
//		String fileName="data.txt";
//		IntimeQueryJob.intimeQuery(clientID, fileName, queriedIdList);
		
		LinkedList<String>queriedIdList=new LinkedList<>();
		queriedIdList.add("1jOVBBr1xJ:0Ts7mlvdUE");
//		queriedIdList.add("OX3jBPtEpV:29Qw64JENQ");
//		queriedIdList.add("bU2BnbN5aG:YuhLj7nkJe");
		String clientID="wangweihua";
		String fileName="data.txt";
		FileTransAssist.uploadFile();
		RouteQueryJob.routeQuery(clientID, fileName, queriedIdList);
		FileTransAssist.downloadResult();
	}
}
