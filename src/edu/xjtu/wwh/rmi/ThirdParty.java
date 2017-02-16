package edu.xjtu.wwh.rmi;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import edu.xjtu.wwh.core.OperHDFS;
import edu.xjtu.wwh.parameter.DefaultParameter;

public class ThirdParty {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//First First get unique clientID and attr_str and base path.
		String base=getBase();
		String clientID=getClientID();
		String attr_str=getAttrStr();
		
		//在RMI服务注册表中查找名称为eci的对象，并调用其上的方法
		CoreFunc cf=null;
    	try {
    		cf=(CoreFunc) Naming.lookup("rmi://localhost:8888/cf");
    		cf.init(base, clientID);
		} catch (MalformedURLException | RemoteException | NotBoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	//Generate related private keys using attr_str
    	try {
			cf.keyInitial(attr_str);
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	//Call decFun
    	byte[] cipher=OperHDFS.readFromHDFS("cipher").getBytes();
    	System.out.println(""+cipher.length);
    	try {
			byte[] rs=cf.decFunc(cipher);
			System.out.println("DEC:"+new String(rs));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	//upd decFun
    	byte[] newCipher=OperHDFS.readFromHDFS("newCipher").getBytes();
    	System.out.println(newCipher.length);
    	try {
			byte[] rs=cf.decFunc(newCipher);
			System.out.println("UPD:"+new String(rs));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private static String getBase() {
		// TODO Auto-generated method stub
		return DefaultParameter.BASE;
	}

	public static String getClientID(){
		return DefaultParameter.TEST_CLIENT_ID;
	}
	public static String getAttrStr(){
		return DefaultParameter.TEST_ATTR_STR;
	}

}
