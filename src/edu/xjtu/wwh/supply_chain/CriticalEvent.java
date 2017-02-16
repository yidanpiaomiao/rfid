package edu.xjtu.wwh.supply_chain;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.apache.commons.lang.RandomStringUtils;

/**
 * This class is intended to present a critical event in supply chain.
 * @author still
 *
 */
public class CriticalEvent implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	public static final String separator="######";
	
	/**
	 *Event type definition.
	 */
	public enum EventType {Observed, Assembled, Disassembled};
	
	/**
	 * Model definition.
	 */
	private String object;
	@SuppressWarnings("unused")
	private HashMap<String, String> objPropSet;
	private String participant;
	@SuppressWarnings("unused")
	private HashMap<String, String> parPropSet;
	private String location;
	@SuppressWarnings("unused")
	private HashMap<String, String> locPropSet;
	private Date timeStamp;
	private EventType eventType;
	private HashMap<String, String> evtProSet;
	
	public String getObject(){
		return object;
	}
	public EventType getEventType(){
		return eventType;
	}
	
	public void newOPer(){
		this.participant=generateParticipantID();
		this.object=generateObjectID(10);
		this.location=getRelatedLocation();
		this.timeStamp=new Date();
		this.eventType=EventType.Observed;
		this.evtProSet=null;
		delay();
	}
	
	public void observedOper(String object){
		this.participant=generateParticipantID();
		this.object=object;
		this.location=getRelatedLocation();
		this.timeStamp=new Date();
		this.eventType=EventType.Observed;
		this.evtProSet=null;	
		delay();	
	}
	
	public void assembledOper(List<String> parent){
		this.participant=generateParticipantID();
		this.object=generateObjectID(10);		
		this.location=getRelatedLocation();
		this.timeStamp=new Date();
		this.eventType=EventType.Assembled;
		
		this.evtProSet=new HashMap<String,String>();
		for (int i=0;i<parent.size();i++) {
			evtProSet.put("parent"+i, parent.get(i));
		}	
		delay();
	}
	
	public void disassembledOper(String object,List<String> child){
		this.participant=generateParticipantID();
		this.object=object;
		this.location=getRelatedLocation();
		this.timeStamp=new Date();
		this.eventType=EventType.Disassembled;
		
		this.evtProSet=new HashMap<String,String>();
		for (int i=0;i<child.size();i++) {
			evtProSet.put("child"+i, child.get(i));
		}
		delay();
	}
	
	/**
	 * Delay random seconds, max is 3 seconds.
	 */
	public void delay(){
		int delay=(new Random().nextInt(3)+1)*1000;
		try {
			Thread.sleep(delay);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * Generate participant ID.
	 */
	private String generateParticipantID(){
		int random=new Random().nextInt(ParticipantData.PAR_NUM);
		return ParticipantData.participant[random];
	}
	/**
	 * Generate an object ID according to participant ID.
	 */
	private String generateObjectID(int lenth){
		return participant+":"+RandomStringUtils.randomAlphanumeric(lenth);
	}
	/**
	 * Get related location.
	 */
	private String getRelatedLocation(){
		return (String)ParticipantData.par_map.get(this.participant);
	}
	
	@Override
	public String toString(){
		String rs= "obj="+object+separator+"par="+participant+separator+"loc="+location+separator+"timeStamp="+timeStamp
				+separator+"eventType="+eventType;
		
		if(evtProSet!=null){
			Set<String> key=evtProSet.keySet();
			Iterator<String> it=key.iterator();
			while(it.hasNext()){
				String one=it.next();
				String two=evtProSet.get(one);
				rs+=separator+one+"="+two;
			}
		}
		return rs;
		
	}
	
	public static byte[] serialize(CriticalEvent ce){
		ByteArrayOutputStream baos=new ByteArrayOutputStream();
		ObjectOutputStream oos;
		try {
			oos = new ObjectOutputStream(baos);
			oos.writeObject(ce);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return baos.toByteArray();
	}
	
	public static CriticalEvent deserialize(byte[] rs){
		CriticalEvent ce=null;
		ByteArrayInputStream bais = new ByteArrayInputStream(rs);
		try {
			ObjectInputStream ois=new ObjectInputStream(bais);
			ce=(CriticalEvent)ois.readObject();
		} catch (ClassNotFoundException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(ce.toString());
		return ce;
	}
}

