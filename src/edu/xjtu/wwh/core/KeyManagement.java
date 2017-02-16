package edu.xjtu.wwh.core;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cpabe.Cpabe;
import edu.xjtu.wwh.parameter.DefaultParameter;
import uenc_application.CpabeTestStringBuilder;
import uenc_cpabe.UpdatableEncryption;

/**
 * This class mainly use Cpabe class and UpdatableEncryption class methods.
 * 
 * @author still
 *
 */
public class KeyManagement {
	/*
	 * clientID indicates whose key will be managed
	 */
	private String clientID;
	private String keyPath;
	
	public KeyManagement(String clientID){
		this.clientID=clientID;
		keyPath = DefaultParameter.BASE+"/"+clientID+"/key";
	}
	/**
	 * This function is intended to generate user specific keys.
	 * @param attr_str attr_str
	 * @return boolean whether the function works well
	 */
	public boolean keyInitial(String attr_str) {
		boolean flag=checkAttrFormat(attr_str);
		if(!flag){
			return false;
		}else{
			Cpabe cpabe = new Cpabe();
			String pubfile = keyPath + "/pub";
			String mskfile = keyPath + "/msk";
			String prvfile = keyPath + "/prv";
			try {
				cpabe.setup(pubfile, mskfile);
				cpabe.keygen(pubfile, prvfile, mskfile, attr_str);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}

			UpdatableEncryption ue = new UpdatableEncryption();
			String ugpFile = keyPath + "/ugp";
			String xFile = keyPath + "/x";
			String uskFile = keyPath + "/usk";
			try {
				ue.uSetup(ugpFile, xFile);
				ue.uKeygen(ugpFile, xFile, uskFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			return true;
		}
		
	}

	/**
	 * This function is intended to check whether an att_str is illegal.
	 * attr_str is like "attr1:obj attr2:obj",
	 * (the blank is important and can not be ignored).
	 * @return boolean
	 */
	private boolean checkAttrFormat(String attr_str) {
		if(attr_str==null)
			return false;
		else {
			String regex="((\\w)+:(\\w)+ )*((\\w)+:(\\w)+)";
			Pattern r=Pattern.compile(regex);
			Matcher m=r.matcher(attr_str);
			if(m.matches()){
				return true;
			}else{
				return false;
			}
		}
	}
	
	/**
	 * This function is intended to generate newusk file and replace old usk file
	 * @return boolean whether the function works well
	 * 
	 */
	public boolean updateUSK(){
		UpdatableEncryption ue = new UpdatableEncryption();
		String uskFile = keyPath + "/usk";
		String newUskFile = keyPath + "/newusk";
		String rkFile = keyPath + "/rk";
		try {
			ue.uKeyUpdate(uskFile, newUskFile, rkFile);
			//Here delete old usk file and replace it with new usk file
			OperHDFS.deleteFileOrDir(uskFile);
			OperHDFS.copyBytes(newUskFile, uskFile);
			//Then it is proper to delete new usk file
			OperHDFS.deleteFileOrDir(newUskFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * This function is intended to upload ACT attr_str.
	 * @param ACT_attr ACT_attr 
	 * @return boolean
	 */
	public boolean uploadACTAttr(String ACT_attr){
		if(checkAttrFormat(ACT_attr)){
			CpabeTestStringBuilder.storeACTAttr(ACT_attr,clientID);
			return true;
		}
		return false;
	}
	
}
