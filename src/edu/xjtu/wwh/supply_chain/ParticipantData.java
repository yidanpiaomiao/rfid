package edu.xjtu.wwh.supply_chain;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import org.apache.commons.lang.RandomStringUtils;

public class ParticipantData {
	public static final String[] location={
			"Anhui", "Beijing", "Chongqing", "Fujian", "Gansu", "Guangdong", "Guangxi", "Guizhou", "Hainan", "Hebei",
			"Heilongjiang", "Henan", "HongKong", "Hubei", "Hunan", "Jiangsu", "Jiangxi", "Jilin", "Liaoning", "Macau",
			"Neimenggu", "Ningxia", "Qinghai", "Shandong", "Shanxi", "Shanxi", "Shanghai", "Sichuan", "Taiwan",
			"Tianjin", "Tibet", "Sinkiang", "Yunnan", "Zhejiang"
	};
	public static final int PAR_LEN=10;
	public static final int PAR_NUM=60;
	public static final String PAR_PATH="PAR.txt";
	public static String[] participant=new String[PAR_NUM];
	public static HashMap<String,String> par_map=new HashMap<String,String>();
	
	public static void initialParData(){
		//Create random data	
		int bound=location.length;
		for(int i=0;i<PAR_NUM;i++){
			participant[i]=RandomStringUtils.randomAlphanumeric(PAR_LEN);
			int random=new Random().nextInt(bound);
			par_map.put(participant[i], location[random]);
		}
		
		//Store data in PAR_PATH
		File file=new File(PAR_PATH);
		if(file.exists()){
			file.delete();
		}
		FileWriter fw = null;
		try {
			fw = new FileWriter(file, true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		PrintWriter pw = new PrintWriter(fw);
		Set<String> key=par_map.keySet();
		Iterator<String> it=key.iterator();
		while(it.hasNext()){
			String one=it.next();
			String two=par_map.get(one);
			String rs=one+" "+two;
			pw.println(rs);
			pw.flush();
		}
		pw.close();
		try {
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
