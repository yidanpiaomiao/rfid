package edu.xjtu.wwh.ed448;

public class Ed448Imp implements Ed448{
	public native void basicTest();//所有native关键词修饰的都是对本地的声明
	public native String getRelatedKeys();
	public native String encrypt(String plain);
	public native String decrypt(String cipher, String keys);
    static {
        System.loadLibrary("ed448");//载入本地库
    }
    public static void main(String[] args) {
        Ed448Imp test=new Ed448Imp();
        //test.basicTest();
       test.encrypt("this dadadadsssssssssssssss test");
    }
}
