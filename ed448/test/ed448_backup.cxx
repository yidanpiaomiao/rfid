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

int main(int argc, char **argv) {
	UNUSED(argc);UNUSED(argv);
	printf("thanks you are working\n");
	return 1;
}
