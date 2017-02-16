package edu.xjtu.wwh.supply_chain;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Query {
	/**
	 * The intime query implementation
	 * @return
	 */
	public static String intimeQuery(String filePath,String queriedOid){	
		//Get input file
		File file = new File(filePath);
		BufferedReader br = null;
		try {
			br=new BufferedReader(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Date maxDate=new Date(0);
		String maxLine="";
		
		String line="";
		try {
			line = br.readLine();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		while(line!=null){
			String[] rs=line.split(CriticalEvent.separator);;
			String oid="";
			boolean observed=false,idEqual=false,max=false;
			
			for(int i=0;i<rs.length;i++){
				if(rs[i].startsWith("obj=")){
					oid=rs[i].substring(4);
					if(oid.equals(queriedOid)){
						idEqual=true;
						continue;
					}else{
						break;
					}
				}
				if(rs[i].startsWith("timeStamp=")){
					String tmp=rs[i].substring(10);
					@SuppressWarnings("deprecation")
					Date date=new Date(tmp);
					if(date.after(maxDate)){
						max=true;
						continue;
					}else{
						break;
					}
					
				}	
				if(rs[i].endsWith("=Observed")){
					observed=true;
					break;
				}	
			}
			
			if(observed && idEqual && max){
				maxLine=line;
			}
			
			try {
				line=br.readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return maxLine;
	}
	
	/**
	 * The route query implementation
	 * @return
	 */
	public static List<String> routeQuery(String filePath,String queriedOid){	
		//Get input file
		File file = new File(filePath);
		BufferedReader br = null;
		try {
			br=new BufferedReader(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		ArrayList<String> list=new ArrayList<String>();
		
		String line="";
		try {
			line = br.readLine();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		while(line!=null){
			String[] rs=line.split(CriticalEvent.separator);;
			String oid="";
			
			for(int i=0;i<rs.length;i++){
				if(rs[i].startsWith("obj=")){
					oid=rs[i].substring(4);
					if(oid.equals(queriedOid)){
						list.add(line);
						break;
					}
				}
				if(rs[i].startsWith("eventType=")){
					String tmp=rs[i].substring(10);
					if(tmp.equals("Assembled")||tmp.equals("Disassembled")){
						continue;
					}else{
						break;
					}
				}	
				if(rs[i].startsWith("child")||rs[i].startsWith("parent")){
					if(rs[i].substring(rs[i].length()-21).equals(queriedOid)){
						list.add(line);
						break;
					}
				}
			}
			
			try {
				line=br.readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
}
