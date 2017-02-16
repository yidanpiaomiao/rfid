package edu.xjtu.wwh.cs;

import java.awt.BorderLayout;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.Box;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ClientUI {
	private String serverAddress="127.0.0.1";
	private int port=5666;
	private Socket socket=null;
	private InputStream is=null;
	private OutputStream os=null;
	public final int BUFFER_SIZE=32767;
	
	private String clientName="client01";
	private String clientFilePath = "Cilent_Data";
	
	public JFrame f = new JFrame("Supply Client v0.1\t");
	public JTextField encFileName = new JTextField(32);
	public JButton encChooseFile = new JButton("File...");
	public JButton encOK = new JButton("Enc");
	
	public JList<String> decList = new JList<>();
	public JButton decOK = new JButton("Dec");
	public JButton updOK = new JButton("Update");
	
	public JTextArea logArea = new JTextArea(8,45);
	
	public FileDialog d = new FileDialog(f, "File...", FileDialog.LOAD);
	
	public ClientUI(){
		socketInit();
		frameInit();
		addListener();
	}
	
	public void socketInit(){
		try {
			socket=new Socket(InetAddress.getByAddress(convertAdress(serverAddress)), port);
			is=socket.getInputStream();
			os=socket.getOutputStream();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public void socketClose(){
		try {
			is.close();
			os.close();
			socket.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * Convert a string to InetAdress format
	 * Attention that this method do not check whether the string is legal
	 * @param adress
	 * @return byte[] result
	 */
	private static byte[] convertAdress(String adress){
		String[] str=adress.split("\\.");
		byte[] result=new byte[4];
		for(int i=0;i<4;i++){
			result[i]=(byte)(Integer.parseInt(str[i]));
		}
		return result;
	}
	
	public void frameInit() {
		// main frame
		f.setBounds(100, 100, 400, 600);
		
		// all borders
		f.add(Box.createVerticalStrut(3), BorderLayout.NORTH);
		f.add(Box.createHorizontalStrut(3), BorderLayout.WEST);
		f.add(Box.createHorizontalStrut(3), BorderLayout.EAST);
		f.add(Box.createVerticalStrut(3), BorderLayout.SOUTH);
		
		// main box
		Box mainBox = Box.createVerticalBox();
				
		// enc box
		Box encBox = Box.createHorizontalBox();
		encBox.setSize(390, 40);
		encBox.add(encFileName);
		encBox.add(Box.createHorizontalStrut(3));
		encBox.add(encChooseFile);
		encBox.add(Box.createHorizontalStrut(3));
		encBox.add(encOK);
		mainBox.add(encBox);
		
		// dec box
		Box decBox = Box.createHorizontalBox();
		decList.setVisibleRowCount(8);
		decBox.add(new JScrollPane(decList));
		
		Box btnBox = Box.createVerticalBox();
		btnBox.add(decOK);
		btnBox.add(updOK);
		decBox.add(btnBox);
		
		mainBox.add(Box.createVerticalStrut(3));
		mainBox.add(decBox);
		
		// log area	
		mainBox.add(Box.createVerticalStrut(3));
		mainBox.add(new JScrollPane(logArea));
		
		f.add(mainBox);
		f.pack();
		f.setVisible(true);		
	}
	
	public void addListener(){
		encChooseFile.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("encChooseFile!");
				d.setVisible(true);
				encFileName.setText(d.getDirectory() + d.getFile());
				// TODO Auto-generated method stub
			}
		});
		
		encOK.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				System.out.println("encOK!");
				if(encFileName.getText().compareTo(new String("")) != 0) {
					try {
						sendEncFile(encFileName.getText());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						logArea.append("sendEncFile fail!");
						e.printStackTrace();
					}
				}
			}
			
		});
		
		decOK.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				System.out.println("decOK!");
				String decFileElem = decList.getSelectedValue();
				//Get the serverFileName
				String decFile = decFileElem.substring(decFileElem.length()-13, decFileElem.length());
				
				if(decFile.compareTo(new String("")) != 0) {
					try {
						recieveDecFile(decFile);
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						logArea.append("recieveDecFile fail!");
						e1.printStackTrace();
					}	
				}
			}
		});
		
		updOK.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				System.out.println("updOK!");
				String updFileElem = decList.getSelectedValue();
				//Get the serverFileName
				String updFile = updFileElem.substring(updFileElem.length()-13, updFileElem.length());
				if(updFile.compareTo(new String("")) != 0) {
					try {
						updateFile(updFile);
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						logArea.append("updateFile file!");
						e1.printStackTrace();
					}
				}
			}
		});
	}
	
	private void sendEncFile(String fileName) throws IOException{							
        //Write the client information
        String serverFileName = "" + System.currentTimeMillis();
        os.write(new String("enc" + ":"+clientName+ ":"+serverFileName).getBytes());
        
        //Receive server reply
        byte[] tmpBytes = new byte[BUFFER_SIZE];
		int len = is.read(tmpBytes);	
        String tmpStr=new String(tmpBytes, 0, len);
		logArea.append("\n" + tmpStr);
		
		//Read file content
		byte[] fileTmpBytes = new byte[BUFFER_SIZE];
		FileInputStream fin = new FileInputStream(fileName);
        int fileLen = 0; 
        while ((fileLen = fin.read(fileTmpBytes))>0) {
            //Send file content
            os.write(fileTmpBytes, 0, fileLen);
            //Receive file reply
    		len = is.read(tmpBytes);
    		tmpStr=new String(tmpBytes, 0, len);
    		logArea.append("\n" + tmpStr);	
        }
        
        //Write EOS
        os.write("EOS".getBytes());
        //Get success state
        len=is.read(fileTmpBytes);
        logArea.append(new String(fileTmpBytes,0,len));
        
        //Update serverFileList 
        if(decList.getModel().getSize() == 0) {
        	DefaultListModel<String> listModel = new DefaultListModel<String>();
            listModel.add(0, fileName + " --- " + serverFileName);
            decList.setModel(listModel); 	
        } else {
            DefaultListModel<String> listModel = (DefaultListModel<String>)decList.getModel();
            listModel.add(listModel.getSize(), fileName + " --- " + serverFileName);
            decList.setModel(listModel); 	
        }
        
        //Close resource
        fin.close();
	}
	
	private void recieveDecFile(String fileName) throws IOException{
		//Write the client operation information  	
        os.write(new String("dec"+":" + clientName+":" + fileName).getBytes());
        
        //Prepare client file path
        File path =new File(clientFilePath);
        if(!path.exists()){
        	path.mkdir();
        }
        
        //Prepare file
        String file = clientFilePath + File.separator + "dec_" + fileName + ".txt";
        
        byte[] tmpBytes=new byte[BUFFER_SIZE];
        int len = 0;
        BufferedWriter bw=null;
        while((len=is.read(tmpBytes))>0 && !new String(tmpBytes,0,len).equals("EOS")){	
			//Write the received content
			bw=new BufferedWriter(new FileWriter(file,true));
			bw.append(new String(tmpBytes,0,len));
			bw.flush();
			//Send reply info
			os.write("one piece!".getBytes());
		}
        
        //Get success state
        len=is.read(tmpBytes);
        logArea.append(new String(tmpBytes,0,len));
        
        //Close resource
        bw.close();	
	}
	
	private void updateFile(String fileName) throws IOException{
		//Write the client operation information  	
		os.write(new String("upd"+":" + clientName+":" + fileName).getBytes());   	
        
		//Receive server reply 
		byte[] tmpBytes = new byte[BUFFER_SIZE];
		int len = is.read(tmpBytes);
        logArea.append(new String(tmpBytes, 0, len));
	}
}
