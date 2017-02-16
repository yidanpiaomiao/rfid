package uenc_application;

import java.util.Random;
import java.util.Stack;

import edu.xjtu.wwh.core.OperHDFS;
import edu.xjtu.wwh.parameter.DefaultParameter;

public class CpabeTestStringBuilder {

	private static final int CHILDREN_MAX = 5;

	public static final int POLICY_RANDOM = 0;
	public static final int POLICY_AND_ALL = 1;
	public static final int POLICY_OR_ALL = 2;
	
	//Return string "attr1:obj attr2:obj ..." 
	//Call in UencMapper
//	public static String getAttributesString(int numOfAttributes) {
//		String attr_str = "attr1:obj";
//
//		for (int i = 1; i < numOfAttributes; i++) {
//			attr_str = attr_str + " attr" + String.valueOf(i + 1) + ":obj";
//		}
//		return attr_str;
//	}

	/**
	 * Add by wwh
	 * If the number of attributes is not enough, padding ACTAttr with" padding:padding...".
	 * If it is out of range, extract the former attributes exactly.
	 * @param numOfAttributes, clientID
	 * @return ACT_str
	 */
	public static String getAttributesString(int numOfAttributes,String clientID){
		String ACT_path=DefaultParameter.BASE+"/"+clientID+"/ACT";
		String ACTAttr=new String(OperHDFS.readFromHDFS(ACT_path).getBytes());
		System.out.println("begin ACTAttr:"+ACTAttr);
		String[] rs=ACTAttr.split(" ");
		int number=rs.length;
		System.out.println("number:"+number);
		
		if(number<numOfAttributes){
			for(int i=number;i<numOfAttributes;i++){
				ACTAttr+=" padding:padding";
			}		
		}else if(number>numOfAttributes){
			ACTAttr="";
			for(int i=0;i<numOfAttributes-1;i++){
				ACTAttr+=(rs[i]+" ");
			}
			ACTAttr+=rs[numOfAttributes-1];
		}
		//Here update the ACTAttr in ACT_path
		OperHDFS.deleteFileOrDir(ACT_path);
		OperHDFS.writeToHDFS(ACTAttr, ACT_path);
		System.out.println("end ACTAttr:"+ACTAttr);
		return ACTAttr;
	}

	/**
	 * Add by wwh
	 * Store the ACTAttr with user specific attr_str on HDFS.
	 * @param ACT_attr clientID
	 */
	public static void storeACTAttr(String ACT_attr,String clientID){
		String ACT_path=DefaultParameter.BASE+"/"+clientID+"/ACT";
		OperHDFS.writeToHDFS(ACT_attr,ACT_path);
		System.out.println("-------------");
		System.out.println("ACT:"+new String(OperHDFS.readFromHDFS(ACT_path).getBytes()));
	}
	
	//Call in UencMapper
	public static String getPolicyString(int numOfLeafNodesMax,
			String attributeString, int policyType) {
		String policyString = "";

		String[] attributeArray = attributeString.split(" ");
		
		Stack<String> s = new Stack<String>();

		for (int i = numOfLeafNodesMax - 1; i >= 0; i--) {
			s.push(attributeArray[i]);
		}

		while (true) {
			Random r = new Random();
			int selected = r.nextInt(CHILDREN_MAX - 2) + 2;

			if (s.size() <= selected) {
				selected = s.size();
			}

			for (int i = 0; i < selected; i++) {
				policyString = policyString + s.pop() + " ";
			}

			String policyNode = getPolicyNode(selected, policyType);
			s.push(policyNode);

			if (s.size() == 1) {
				policyString = policyString + s.pop();
				break;
			}
		}

		return policyString;
	}

	//Local used
	private static String getPolicyNode(int numOfLeafNodes, int policyType) {
		
		/*
		 * policyType 是生成访问控制结构树的参数
		 * 0：随机
		 * 1：全与
		 * 2：全或
		 */
		
		int selected = 0;
		
		switch(policyType) {
		case CpabeTestStringBuilder.POLICY_RANDOM:
			Random r = new Random();
			selected = r.nextInt(numOfLeafNodes) + 1;
			break;
		case CpabeTestStringBuilder.POLICY_AND_ALL:
			selected = numOfLeafNodes;
			break;
		case CpabeTestStringBuilder.POLICY_OR_ALL:
			selected = 1;
			break;
		}
		
		return String.valueOf(selected) + "of" + String.valueOf(numOfLeafNodes);
	}

}