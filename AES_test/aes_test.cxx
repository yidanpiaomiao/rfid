#include "open.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <vector>
#include <stdint.h>

using namespace std;

const uint32_t message_size = 1024*1024;
const uint32_t iterations = 10;
char *str=new char[message_size];

int aes_decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
  unsigned char *iv, unsigned char *plaintext)
{
  EVP_CIPHER_CTX *ctx;
  int len;
  int plaintext_len;

  ctx = EVP_CIPHER_CTX_new();
  EVP_DecryptInit_ex(ctx, EVP_aes_256_ctr(), NULL, key, iv);
  EVP_DecryptUpdate(ctx, plaintext, &len, ciphertext, ciphertext_len);
  plaintext_len = len;

  EVP_DecryptFinal_ex(ctx, plaintext + len, &len);
  plaintext_len += len;

  /* Clean up */
  EVP_CIPHER_CTX_free(ctx);

  return plaintext_len;
}

int aes_encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
  unsigned char *iv, unsigned char *ciphertext)
{
  EVP_CIPHER_CTX *ctx;

  int len;
  int ciphertext_len;

  ctx = EVP_CIPHER_CTX_new();
  EVP_EncryptInit_ex(ctx, EVP_aes_256_ctr(), NULL, key, iv);
  EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len);

  ciphertext_len = len;
  EVP_EncryptFinal_ex(ctx, ciphertext + len, &len);
  ciphertext_len += len;

  //mark
  cout<<"cipher_len"<<ciphertext_len<<endl;

  /* Clean up */
  EVP_CIPHER_CTX_free(ctx);

  return ciphertext_len;
}

static double now(void) {
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec + tv.tv_usec / 1000000.0;
}

void gen_random(char *s, const int len) {
	srand(time(NULL));
	static const char alphanum[] = "0123456789"
			"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			"abcdefghijklmnopqrstuvwxyz";
	//cout << sizeof(alphanum) << endl;
	//cout << "gen_start" << endl;
	for (int i = 0; i < len-1; ++i) {
		s[i] = alphanum[rand() % (sizeof(alphanum) - 1)];
		//cout << s[i];
	}
	s[len-1]='\0';
	//cout << endl;
}


void aes_benchmark(unsigned char* message,double *enc_time,double *dec_time)
{
  unsigned char key[256];
  unsigned char iv[128];
  // add 16 in case of ctr padding
  unsigned char ciphertext[message_size + 16];
  unsigned char decryptedtext[message_size + 1];
  int decryptedtext_len, ciphertext_len;

  gen_random((char*) key, 256);
  gen_random((char*) iv, 128);
  /* Initialise the library */
  ERR_load_crypto_strings();
  OpenSSL_add_all_algorithms();
  OPENSSL_config(NULL);

  double enc_start = now();
  for (uint32_t i = 0; i < iterations; i++) {
    ciphertext_len = aes_encrypt (message, message_size, key, iv,
                                 ciphertext);
//    cout<<"message_size"<<message_size<<endl;
//    cout<<"ciphertext_len"<<ciphertext_len<<endl;
  }
  double duration = now() - enc_start;
  cout << "Encryption time: " << duration/iterations << endl;
  *enc_time=duration/iterations;

  double dec_start = now();
  for (uint32_t i = 0; i < iterations; i++) {
    decryptedtext_len = aes_decrypt(ciphertext, ciphertext_len, key, iv,
                                    decryptedtext);
  }
  double duration2 = now() - dec_start;
  cout << "Decryption time: " << duration2/iterations << endl;
  *dec_time=duration2/iterations;

  decryptedtext[decryptedtext_len] = '\0';

  // uncomment to check if decrypted text is correct
  //printf("Decrypted text is:\n");
  //printf("%s\n", decryptedtext);

  /* Clean up */
  EVP_cleanup();
  ERR_free_strings();

}

int main(){
	double enc_time=0;
	double dec_time=0;
	double all_enc_time=0;
	double all_dec_time=0;
	int cycle=10;

	for(int i=0;i<cycle;i++){
		gen_random(str, message_size);
		cout<<"----------------"<<endl<<str<<endl<<"------------------------"<<endl;
		aes_benchmark((unsigned char*)str,&enc_time,&dec_time);
		cout<<"i"<<i<<endl;
		cout<<"enc_time"<<enc_time<<endl;
		cout<<"dec_time"<<dec_time<<endl;
		all_enc_time+=enc_time;
		all_dec_time+=dec_time;
	}
	cout<<"all_enc_time:"<<all_enc_time<<endl;
	cout<<"all_dec_time:"<<all_dec_time<<endl;
	return 1;
}
