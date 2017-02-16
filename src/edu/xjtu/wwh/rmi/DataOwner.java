package edu.xjtu.wwh.rmi;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import edu.xjtu.wwh.core.OperHDFS;
import edu.xjtu.wwh.parameter.DefaultParameter;

/**
 * This class represents the data owner's operation
 * @author still
 *
 */
public class DataOwner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//First get unique clientID and ACT and base path.
		String base=getBase();
		String clientID=getClinetID();
		String ACT=getACT();
		
		//在RMI服务注册表中查找名称为eci的对象，并调用其上的方法
		CoreFunc cf=null;
    	try {
			 cf=(CoreFunc) Naming.lookup("rmi://localhost:8888/cf");
			 cf.init(base, clientID);
		} catch (MalformedURLException | RemoteException | NotBoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	//Generate related keys using ACT
    	try {
    		cf.uploadACT(ACT);
			cf.encSetup();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	//Call encFun
    	byte[] plain="this is just a test".getBytes();
    	byte[] rs=null;
    	try {
			rs=cf.encFunc(plain);
			System.out.println("ENC:"+new String(rs));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	//Store encryted bytes in database
    	//unimplemented! using static variable to instead
    	OperHDFS.writeToHDFS(rs, "cipher");
    	
    	//upd operation
    	try {
			cf.updateKey();
			OperHDFS.writeToHDFS(cf.updFunc(rs),"newCipher");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static String getBase() {
		// TODO Auto-generated method stub
		return DefaultParameter.BASE;
	}
	
	public static String getClinetID()
	{
		return DefaultParameter.TEST_CLIENT_ID;
	}
	
	public static String getACT(){
		return DefaultParameter.ACT;
	}
}
