package edu.xjtu.wwh.core;

import edu.xjtu.wwh.parameter.DefaultParameter;

public class CoreFuncEntry {

	public static void main(String[] args) {
		String revStr="testfadadadfdasfsffffffffff";
		String serverFileName="18792730949.txt";
		String base=DefaultParameter.BASE;
		String clientID=DefaultParameter.TEST_CLIENT_ID;
		KeyManagement km=new KeyManagement(clientID);
		CoreFunc cf=new CoreFunc(serverFileName,base,clientID);
		try {
			cf.encFunc(revStr);
			System.out.println(cf.decFunc());
			
			//update usk file first
			km.updateUSK();
			cf.updFunc();
			System.out.println(cf.decFunc());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
