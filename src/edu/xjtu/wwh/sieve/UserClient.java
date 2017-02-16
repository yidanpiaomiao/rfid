package edu.xjtu.wwh.sieve;

import java.io.IOException;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.hadoop.io.BytesWritable;

import edu.xjtu.wwh.core.CoreFunc;
import edu.xjtu.wwh.core.KeyManagement;
import edu.xjtu.wwh.parameter.DefaultParameter;

/**
 * This class is intended to represent Sieve user client
 * 
 * The main functions include "encrypt original data and uploads ABE-encrypted 
 * data to a storage provider"
 * (StorageDaemon class)
 * 
 * AND "generate a data policy for a third party web service && translates the 
 * policy into an ABE decryption key and send the key to the web service"
 * (ImportDaemon class)
 * 
 * @author still
 *
 */
public class UserClient {
	private String clientID;
	private KeyManagement km;
	private StorageDaemon sd;
	
	public UserClient(String clientID){
		this.clientID=clientID;
		km=new KeyManagement(clientID);
		sd=new StorageDaemon();
	}
	
	/**
	 * This function is intended to encrypt metadata before uploading using ABE encryption.
	 * Metadata will be stored in MongoDB.
	 * @param GUID, AESKey
	 * @return BytesWritable
	 */
	public BytesWritable encMetadata(String GUID,String AESKey){
		String serverFileName=GUID;
		String base=DefaultParameter.BASE;
		CoreFunc cf=new CoreFunc(serverFileName, base, clientID);
		try {
			return cf.encFunc(AESKey);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * This function is intended to encrypt data before uploading using AES-ECB-128.
	 * @deprecated Caution: AES is not a good idea , you should change it with re-encryption scheme.
	 * Data will be stored in BerkelyDB.
	 * @param sSrc, sKey
	 * @return cipher
	 */
	public String encData(String sSrc, String sKey) throws Exception{
		// 加密
		if (sKey == null) {
			System.out.print("Key为空null");
			return null;
		}
		// 判断Key是否为16位
		if (sKey.length() != 16) {
			System.out.print("Key长度不是16位");
			return null;
		}
		byte[] raw = sKey.getBytes("utf-8");
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");// "算法/模式/补码方式"
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
		return new Base64().encodeToString(encrypted);// 此处使用BASE64做转码功能，同时能起到2次加密的作用。
	}
	
	/**
	 * This function is intended to decrypt data that was encrypted using AES-CTR-128.
	 * @param sSrc,sKey
	 * @return plain
	 * @deprecated
	 */
    public static String decData(String sSrc, String sKey) throws Exception {
        try {
            // 判断Key是否正确
            if (sKey == null) {
                System.out.print("Key为空null");
                return null;
            }
            // 判断Key是否为16位
            if (sKey.length() != 16) {
                System.out.print("Key长度不是16位");
                return null;
            }
            byte[] raw = sKey.getBytes("utf-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            byte[] encrypted1 = new Base64().decode(sSrc);//先用base64解密
            try {
                byte[] original = cipher.doFinal(encrypted1);
                String originalString = new String(original,"utf-8");
                return originalString;
            } catch (Exception e) {
                System.out.println(e.toString());
                return null;
            }
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return null;
        }
    }
	
	/**
	 * This function is intended to upload encrypted data first, 
	 * then the storage provide will response with GUID;
	 * @param cipher
	 * @return GUID
	 */
	public String uploadEncData(String cipher) {	
		String GUID=sd.receiveEncData(cipher);
		return GUID;
	}
	
	/**
	 * This function is intended to upload encrypted data second, 
	 * @param GUID ,metaCipher
	 * @return 
	 */
	public void uploadEncMetadata(String GUID,byte[] metaCipher){
		sd.receiveEncMetadata(GUID,metaCipher);
	}

	/**
	 * This function is intended to generate ACT policy for the specific data.
	 * @param ACT_attr
	 * @return
	 */
	public boolean generateACT(String ACT_attr){
		return km.uploadACTAttr(ACT_attr);
	}
	
	/**
	 * This function is intended to generate ABE policy for third party.
	 * @param attr_str
	 * @return
	 */
	public boolean generatePolicy(String attr_str){
		return km.keyInitial(attr_str);
	}
	
	/**
	 * This function is intended to distribute ABE decryption key to third party 
	 * and should not be called directly.
	 * But it is called in ImportDaemon.
	 * @return
	 */
	public void sendKey(){
		//Unimplemented
	}
	
	/**
	 * This function is intended to assign attributes to User Data.<br>
	 * Caution: This is a simplified method to handle the question
	 */
	public void assignAttributes(String ACT_attr){
		generateACT(ACT_attr);
	}
}
