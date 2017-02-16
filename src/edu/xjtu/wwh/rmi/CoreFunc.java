package edu.xjtu.wwh.rmi;

import java.io.IOException;
import java.rmi.Remote;
import java.rmi.RemoteException;

public interface CoreFunc extends Remote{
	/**
	 * This function is intended to initialize CoreFunc object.
	 * @param base base
	 * @param clientID clientID
	 * @throws RemoteException RemoteException
	 */
	public void init(String base,String clientID)throws RemoteException;
	
	/**
	 * This function is intended to encrypt plain data.
	 * @param plain plain
	 * @return
	 * @throws IOException
	 * @throws RemoteException
	 */

	public byte[] encFunc(byte[] plain) throws IOException,RemoteException;
	
	/**
	 * This function is intended to decrypt cipher data.
	 * @param cipher
	 * @return
	 * @throws IOException
	 * @throws RemoteException
	 */
	public byte[] decFunc(byte[] cipher) throws IOException,RemoteException;
	
	/**
	 * This function is intended to update old cipher data into new cipher data.
	 * @param cipher
	 * @return
	 * @throws IOException
	 * @throws RemoteException
	 */
	public byte[] updFunc(byte[] oldCipher) throws IOException,RemoteException;
	
	/**
	 * This function is intended to clean directory after operating. 
	 * @return
	 * @throws RemoteException
	 */
	public boolean cleanDir() throws RemoteException;
	
	/**
	 * This function is intended to upload ACT_str to HDFS.
	 * @param ACT_str
	 * @return
	 * @throws RemoteException
	 */
	public boolean uploadACT(String ACT_str)throws RemoteException;
	
	/**
	 * This function is intended to generate private key(ABE-prv) for user specific attr_str.
	 * Mainly used for CP-ABE
	 * @param attr_str
	 * @return
	 * @throws RemoteException
	 */
	public boolean keyInitial(String attr_str)throws RemoteException;
	
	/**
	 * This function is intended to update "usk" to new "usk" and generate "rk".
	 * Mainly used for Updatable-Enc
	 * @return
	 * @throws RemoteException
	 */
	public boolean updateKey() throws RemoteException;
	
	/**
	 * This function is intended to generate related keys before encryption.
	 * @return
	 * @throws RemoteException
	 */
	public boolean encSetup()throws RemoteException;
}
