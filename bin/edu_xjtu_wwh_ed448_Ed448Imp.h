/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class edu_xjtu_wwh_ed448_Ed448Imp */

#ifndef _Included_edu_xjtu_wwh_ed448_Ed448Imp
#define _Included_edu_xjtu_wwh_ed448_Ed448Imp
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     edu_xjtu_wwh_ed448_Ed448Imp
 * Method:    basicTest
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_basicTest
  (JNIEnv *, jobject);

/*
 * Class:     edu_xjtu_wwh_ed448_Ed448Imp
 * Method:    getRelatedKeys
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_getRelatedKeys
  (JNIEnv *, jobject);

/*
 * Class:     edu_xjtu_wwh_ed448_Ed448Imp
 * Method:    encrypt
 * Signature: (Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_encrypt
  (JNIEnv *, jobject, jstring);

/*
 * Class:     edu_xjtu_wwh_ed448_Ed448Imp
 * Method:    decrypt
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_edu_xjtu_wwh_ed448_Ed448Imp_decrypt
  (JNIEnv *, jobject, jstring, jstring);

#ifdef __cplusplus
}
#endif
#endif
