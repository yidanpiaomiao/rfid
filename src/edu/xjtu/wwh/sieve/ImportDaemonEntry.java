package edu.xjtu.wwh.sieve;

import edu.xjtu.wwh.parameter.DefaultParameter;

public class ImportDaemonEntry {
	public static void main(String[] args){
		ImportDaemon id=new ImportDaemon(DefaultParameter.TEST_CLIENT_ID);
		id.decryptData(id.getGUID());
	}
}
