#include "ed448.h"

#include <jni.h>
#include <stdio.h>
//add by wwh
#include "revocation.hxx"
#define UNUSED(x) (void)(x)

JNIEXPORT void JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_basicTest
  (JNIEnv * env, jobject thisjob) {
   UNUSED(env);
   UNUSED(thisjob);
	printf("c: Hello World!\n");
   basic_test();
   run_benchmarks("this is just a test string");
   return;
}

//JNIEXPORT jstring JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_getRelatedKeys
//  (JNIEnv *env, jobject obj){
//	UNUSED(env);
//	UNUSED(obj);
//	printf("C:getRelatedKeys\n");
//	const char*str = env->GetStringUTFChars(original, 0);
//	unsigned int len=str-
//	if(str==NULL){
//		cout<<"sb"<<endl;
//	}
//	cout<<str<<endl;
//	return "wangweihua";
//}

JNIEXPORT jstring JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_encrypt
  (JNIEnv *env, jobject obj, jstring plain){
	UNUSED(env);
	UNUSED(obj);
	const char*str = env->GetStringUTFChars(plain, 0);
	if(str==NULL){
		str="wangweihuanimei";
	}
	cout << "plain:" << str << endl;

	//const char* to char* safely
	int len = strlen(str);
	char* tmp = new char[len + 1];
	strcpy(tmp,str);
	char* keys=NULL;
	wwh_encrypt(tmp,keys);
	return plain;
}

//JNIEXPORT jstring JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_decrypt
//  (JNIEnv *env , jobject obj, jstring cipher, jstring keys){
//	UNUSED(env);
//	UNUSED(obj);
//	printf("C:decrypt\n");
//	return cipher+keys;
//}

int main(int argc, char **argv) {
	UNUSED(argc);UNUSED(argv);
	printf("thanks you are working\n");
	return 1;
}
