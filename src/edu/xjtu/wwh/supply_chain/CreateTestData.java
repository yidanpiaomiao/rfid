package edu.xjtu.wwh.supply_chain;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

public class CreateTestData {
	public static final String filePath="data.txt";
	
	public static void createData(){
		File file = new File(filePath);
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
		
		//Initialize participant data
		ParticipantData.initialParData();
		
		for(int i=0;i<10;i++){		
			CriticalEvent ce=new CriticalEvent();
			LinkedList<String> list=new LinkedList<String>();
			
			//New
			for(int j=0;j<40;j++){	
				ce.newOPer();
				list.add(ce.getObject());
				pw.println(ce.toString());	
				pw.flush();
			}
			//Cycle
			for(int cycle=0;cycle<1;cycle++){	
				//Observed
				for(int j=0;j<40;j++){
					ce.observedOper(list.get(j));
					pw.println(ce.toString());
					pw.flush();
				}
				
				LinkedList<String> assembled=new LinkedList<String>();
				//Assembled	
				for(int k=0;k<4;k++){
					ce.assembledOper(list.subList(k*10, (k+1)*10));
					assembled.add(ce.getObject());
					pw.println(ce.toString());
					pw.flush();
				}
				
				//Observed
				for(int j=0;j<4;j++){
					ce.observedOper(assembled.get(j));
					pw.println(ce.toString());
					pw.flush();
					
				}
				
				//Disassembled
				for(int l=0;l<4;l++){
					ce.disassembledOper(assembled.get(l),list.subList(l*10, (l+1)*10));
					pw.println(ce.toString());
					pw.flush();
				}
			}
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
