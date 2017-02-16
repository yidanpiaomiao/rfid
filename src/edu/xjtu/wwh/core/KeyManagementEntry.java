package edu.xjtu.wwh.core;

import edu.xjtu.wwh.parameter.DefaultParameter;

public class KeyManagementEntry {
	public static void main(String[] args){
		String clientID=DefaultParameter.TEST_CLIENT_ID;
		KeyManagement km=new KeyManagement(clientID);
		String ACTAttr="school:xjtu depart:cs";
		km.uploadACTAttr(ACTAttr);
		
		String attr_str="school:xjtu";
		
		System.out.println(km.keyInitial(attr_str));
	}
}
