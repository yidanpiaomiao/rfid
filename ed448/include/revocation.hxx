#include <fstream>
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <vector>

#include "revocation.h"
#define UNUSED(x) (void)(x)

using namespace std;

vector<std::string> &split(const string &s, char delim, vector<string> &elems);
vector<string> split(const string &s, char delim);
string base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len);
void base64_decode(string const& encoded_string, unsigned char* output);
void gen_random(char *s, const int len);
unsigned char encrypt(Point &output, const Block &m, const Scalar &k,
		const Scalar &n, const int i);
void decrypt(SecureBuffer &message, const Point ct, const Scalar &k,
		const Scalar &n, const int i, const unsigned char hint);
void rekey(Point &new_ct, const Point ct, const Scalar &delta, const Scalar &n,
		const int i);
bool wwh_encrypt(char *plain, char* keys);
bool basic_test();
void run_benchmarks(const char* test_string);
void full_decrypt(char* data, char* kdata, char* ndata, char* hints);
void full_encrypt(char* data, char* key);
bool full_test();

//AES declaration
int aes_decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
  unsigned char *iv, unsigned char *plaintext);
int aes_encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
  unsigned char *iv, unsigned char *ciphertext);
void aes_benchmark(unsigned char* message);

const uint32_t BLOCK_SIZE = Point::HASH_BYTES;
const uint32_t message_size = 1024 * 10;
const uint32_t iterations = 1;

//base 64  Alphabet
static const string base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		"abcdefghijklmnopqrstuvwxyz"
		"0123456789+/";

vector<std::string> &split(const string &s, char delim, vector<string> &elems) {
	stringstream ss(s);
	string item;
	while (getline(ss, item, delim)) {
		elems.push_back(item);
	}
	return elems;
}

//static void print(const char *name, const Point &x) {
//    unsigned char buffer[Point::SER_BYTES];
//    x.encode(buffer);
//    printf("  %s = 0x", name);
//    for (int i=sizeof(buffer)-1; i>=0; i--) {
//        printf("%02x", buffer[i]);
//    }
//    printf("\n");
//}
//
//static void print(const char *name, const Scalar &x) {
//    unsigned char buffer[Scalar::SER_BYTES];
//    x.encode(buffer);
//    printf("  %s = 0x", name);
//    for (int i=sizeof(buffer)-1; i>=0; i--) {
//        printf("%02x", buffer[i]);
//    }
//    printf("\n");
//}

//split string using "delim"
vector<string> split(const string &s, char delim) {
	vector<string> elems;
	split(s, delim, elems);
	return elems;
}

//whether is illegal base64 alphabet
static inline bool is_base64(unsigned char c) {
	return (isalnum(c) || (c == '+') || (c == '/'));
}

string base64_encode(unsigned char const* bytes_to_encode,
		unsigned int in_len) {
	string ret;
	int i = 0;
	int j = 0;
	unsigned char char_array_3[3];
	unsigned char char_array_4[4];

	while (in_len--) {
		char_array_3[i++] = *(bytes_to_encode++);
		if (i == 3) {
			char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
			char_array_4[1] = ((char_array_3[0] & 0x03) << 4)
					+ ((char_array_3[1] & 0xf0) >> 4);
			char_array_4[2] = ((char_array_3[1] & 0x0f) << 2)
					+ ((char_array_3[2] & 0xc0) >> 6);
			char_array_4[3] = char_array_3[2] & 0x3f;

			for (i = 0; (i < 4); i++)
				ret += base64_chars[char_array_4[i]];
			i = 0;
		}
	}

	if (i) {
		for (j = i; j < 3; j++)
			char_array_3[j] = '\0';

		char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
		char_array_4[1] = ((char_array_3[0] & 0x03) << 4)
				+ ((char_array_3[1] & 0xf0) >> 4);
		char_array_4[2] = ((char_array_3[1] & 0x0f) << 2)
				+ ((char_array_3[2] & 0xc0) >> 6);
		char_array_4[3] = char_array_3[2] & 0x3f;

		for (j = 0; (j < i + 1); j++)
			ret += base64_chars[char_array_4[j]];

		while ((i++ < 3))
			ret += '=';

	}

	return ret;

}

void base64_decode(string const& encoded_string, unsigned char* output) {
	int in_len = encoded_string.size();
	int i = 0;
	int j = 0;
	int in_ = 0;
	unsigned char char_array_4[4], char_array_3[3];
	uint32_t count = 0;

	while (in_len-- && (encoded_string[in_] != '=')
			&& is_base64(encoded_string[in_])) {
		char_array_4[i++] = encoded_string[in_];
		in_++;
		if (i == 4) {
			for (i = 0; i < 4; i++)
				char_array_4[i] = base64_chars.find(char_array_4[i]);

			char_array_3[0] = (char_array_4[0] << 2)
					+ ((char_array_4[1] & 0x30) >> 4);
			char_array_3[1] = ((char_array_4[1] & 0xf) << 4)
					+ ((char_array_4[2] & 0x3c) >> 2);
			char_array_3[2] = ((char_array_4[2] & 0x3) << 6) + char_array_4[3];

			for (i = 0; (i < 3); i++) {
				output[count] = char_array_3[i];
				count++;
			}
			i = 0;
		}
	}

	if (i) {
		for (j = i; j < 4; j++)
			char_array_4[j] = 0;

		for (j = 0; j < 4; j++)
			char_array_4[j] = base64_chars.find(char_array_4[j]);

		char_array_3[0] = (char_array_4[0] << 2)
				+ ((char_array_4[1] & 0x30) >> 4);
		char_array_3[1] = ((char_array_4[1] & 0xf) << 4)
				+ ((char_array_4[2] & 0x3c) >> 2);
		char_array_3[2] = ((char_array_4[2] & 0x3) << 6) + char_array_4[3];

		for (j = 0; (j < i - 1); j++) {
			output[count] = char_array_3[j];
			count++;
		}
	}

}

//how many seconds
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

unsigned char encrypt(Point &output, const Block &m, const Scalar &k,
		const Scalar &n, const int i) {
	//N+j
	Scalar hash_input = n + Scalar(i);

	SHAKE<256> shake;
	shake.update(SecureBuffer(hash_input));
	SecureBuffer h0 = shake.output(BLOCK_SIZE);
	// We don't need hint for hash
	Point hash_pt = Point::from_hash(h0);

	Point m_pt;
	unsigned char hint = m_pt.set_to_hash(m);

	// do actual multiplication and encryption
	output = m_pt + k * hash_pt;
	// output hint;
	return hint;
}

void decrypt(SecureBuffer &message, const Point ct, const Scalar &k,
		const Scalar &n, const int i, const unsigned char hint) {
	Scalar hash_input = n + Scalar(i);

	SHAKE<256> shake;
	shake.update(SecureBuffer(hash_input));
	SecureBuffer h0 = shake.output(BLOCK_SIZE);
	// We don't need hint for hash
	Point hash_pt = Point::from_hash(h0);

	// do the decryption
	Point m_pt = ct - k * hash_pt;

	// now convert it back into a block
	m_pt.invert_elligator(message, hint);
}

void rekey(Point &new_ct, const Point ct, const Scalar &delta, const Scalar &n,
		const int i) {
	Scalar hash_input = n + Scalar(i);

	SHAKE<256> shake;
	shake.update(SecureBuffer(hash_input));
	SecureBuffer h0 = shake.output(BLOCK_SIZE);
	// We don't need hint for hash
	Point hash_pt = Point::from_hash(h0);

	new_ct = ct + delta * hash_pt;
	//print("new_ct",new_ct);
}
///add by wwh
//keys means collection of related keys, format"k,n,hints"
bool wwh_encrypt(char *plain,char* keys) {
	UNUSED(keys);
	cout << "original:" << plain << endl;
	Block message(plain);
	int message_blocks = message.size() / BLOCK_SIZE + 1;
	cout << "block size:" << message_blocks << endl;

	Point* encrypted_blocks = new Point[message_blocks];

	unsigned char* hints = new unsigned char[message_blocks];
	// initiate random number generator
	SpongeRng rng;
	// create secret key
	Scalar k(rng);

	//add by wwh
	string keys_str="";
	unsigned char* k_encode=new unsigned char[BLOCK_SIZE];
	k.encode(k_encode);
	cout<<"k_encode"<<k_encode<<endl;
	string k_str=(char*)k_encode;
	cout<<"k_str"<<k_str<<endl;
	keys_str+=(k_str+"#");
	cout<<"keys_str"<<keys_str<<endl;

//	// create second key for re-keying
//	Scalar kprime(rng);
//	Scalar delta = kprime - k;

	// generate nonce for the message
	Scalar n(rng);
	//test OK
	string one="nihao";
	string two="wohao";
	one+=two;
	cout<<"one---------------------:"<<one<<endl;

	unsigned char* n_encode = new unsigned char[BLOCK_SIZE];
	n.encode(n_encode);
	cout << "n_encode" << n_encode << endl;
	string n_str = (char*) n_encode;
	cout << "n_str" << n_str << endl;
	keys_str += (n_str+"#");
	cout << "keys_str" << keys_str << endl;

	for (int i = 0; i < message_blocks; i++) {
		size_t len = BLOCK_SIZE;
		if ((i * BLOCK_SIZE + len) >= message.size()) {
			len = message.size() - i * BLOCK_SIZE;
		}
		Block m = message.slice(i * BLOCK_SIZE, len);
		hints[i] = encrypt(encrypted_blocks[i], m, k, n, i);
	}

	//add by wwh
	string hints_str=(char*)hints;
	cout<<"hints"<<hints<<endl;
	keys_str+=hints_str;
	cout << "keys_str" << keys_str << endl;

	string first_decrypt = "";
	for (int i = 0; i < message_blocks; i++) {
		SecureBuffer m(BLOCK_SIZE);
		decrypt(m, encrypted_blocks[i], k, n, i, hints[i]);
		first_decrypt += m.get_string();
	}
	cout << "first_decrypt:" << first_decrypt << endl;

//	// re-key the data and then try to decrypt that
//	Point* re_encrypted_blocks = new Point[message_blocks];
//	for (int i = 0; i < message_blocks; i++) {
//		rekey(re_encrypted_blocks[i], encrypted_blocks[i], delta, n, i);
//	}
//
//	string second_decrypt = "";
//	for (int i = 0; i < message_blocks; i++) {
//		SecureBuffer m(BLOCK_SIZE);
//		decrypt(m, re_encrypted_blocks[i], kprime, n, i, hints[i]);
//		second_decrypt += m.get_string();
//	}
//	cout << "second_decrypt:" << second_decrypt << endl;
//
//	if (first_decrypt == second_decrypt) {
//		return true;
//	} else {
//		return false;
//	}
	return true;
}
/* Test that checks the encryption, decryption, and re-keying
 functions to make sure they pass. */

bool basic_test() {
	// test data
	const uint32_t str_len = 100;
	char test_string[str_len + 1];
	gen_random(test_string, str_len+1);

	cout << "original:" << test_string << endl;

	Block message(test_string);
	int message_blocks = message.size() / BLOCK_SIZE + 1;
	cout << "block size:" << message_blocks << endl;

	Point* encrypted_blocks = new Point[message_blocks];

	unsigned char* hints = new unsigned char[message_blocks];
	// initiate random number generator
	SpongeRng rng;
	// create secret key
	Scalar k(rng);

	// create second key for re-keying
	Scalar kprime(rng);
	Scalar delta = kprime - k;

	// generate nonce for the message
	Scalar n(rng);

	for (int i = 0; i < message_blocks; i++) {
		size_t len = BLOCK_SIZE;
		if ((i * BLOCK_SIZE + len) >= message.size()) {
			len = message.size() - i * BLOCK_SIZE;
		}
		Block m = message.slice(i * BLOCK_SIZE, len);
		hints[i] = encrypt(encrypted_blocks[i], m, k, n, i);
	}

	string first_decrypt = "";
	for (int i = 0; i < message_blocks; i++) {
		SecureBuffer m(BLOCK_SIZE);
		decrypt(m, encrypted_blocks[i], k, n, i, hints[i]);
		first_decrypt += m.get_string();
	}
	cout << "first_decrypt:" << first_decrypt << endl;

	// re-key the data and then try to decrypt that
	Point* re_encrypted_blocks = new Point[message_blocks];
	for (int i = 0; i < message_blocks; i++) {
		rekey(re_encrypted_blocks[i], encrypted_blocks[i], delta, n, i);
	}

	string second_decrypt = "";
	for (int i = 0; i < message_blocks; i++) {
		SecureBuffer m(BLOCK_SIZE);
		decrypt(m, re_encrypted_blocks[i], kprime, n, i, hints[i]);
		second_decrypt += m.get_string();
	}
	cout << "second_decrypt:" << second_decrypt << endl;

	if (first_decrypt == second_decrypt) {
		return true;
	} else {
		return false;
	}
	return true;
}

void run_benchmarks(const char* test_string) {

	// Starting parameters for the crypto
	Block message(test_string);
	int message_blocks = message.size() / BLOCK_SIZE + 1;

	Point* encrypted_blocks = new Point[message_blocks];
	unsigned char* hints = new unsigned char[message_blocks];
	// initiate random number generator
	SpongeRng rng;
	// create secret key
	Scalar k(rng);

	// create second key for re-keying
	Scalar kprime(rng);
	Scalar delta = kprime - k;

	// generate nonce for the message
	Scalar n(rng);

	double encrypt_total = 0;
	for (uint32_t i = 0; i < iterations; i++) {
		double start = now();
		for (int j = 0; j < message_blocks; j++) {
			size_t len = BLOCK_SIZE;
			if ((j * BLOCK_SIZE + len) >= message.size()) {
				len = message.size() - j * BLOCK_SIZE;
			}
			Block m = message.slice(j * BLOCK_SIZE, len);
			hints[j] = encrypt(encrypted_blocks[j], m, k, n, j);
		}
		double duration = now() - start;
		encrypt_total += duration;
	}

	cout << "Encrypt time: " << encrypt_total / iterations << endl;

	double decrypt_total = 0;
	for (uint32_t i = 0; i < iterations; i++) {
		double start = now();
		for (int j = 0; j < message_blocks; j++) {
			//cout << "enter" << j << endl;
			SecureBuffer m(BLOCK_SIZE);
			//cout << "size:" << m.size() << endl;

			decrypt(m, encrypted_blocks[j], k, n, j, hints[j]);
			//cout << "content:" << m.get_string() << endl;
		}
		double duration = now() - start;
		decrypt_total += duration;
	}

	cout << "Decrypt time: " << decrypt_total / iterations << endl;

	double rekey_total = 0;
	for (uint32_t i = 0; i < iterations; i++) {
		double start = now();
		Point* re_encrypted_blocks = new Point[message_blocks];
		for (int i = 0; i < message_blocks; i++) {
			rekey(re_encrypted_blocks[i], encrypted_blocks[i], delta, n, i);
		}
		double duration = now() - start;
		rekey_total += duration;
	}

	cout << "Rekey time: " << rekey_total / iterations << endl;

}

int aes_decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
  unsigned char *iv, unsigned char *plaintext)
{
  EVP_CIPHER_CTX *ctx;
  int len;
  int plaintext_len;

  ctx = EVP_CIPHER_CTX_new();
  EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv);
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
  EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv);
  EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len);

  ciphertext_len = len;
  EVP_EncryptFinal_ex(ctx, ciphertext + len, &len);
  ciphertext_len += len;

  /* Clean up */
  EVP_CIPHER_CTX_free(ctx);

  return ciphertext_len;
}

void aes_benchmark(unsigned char* message)
{
  unsigned char key[256];
  unsigned char iv[128];
  // add 16 in case of CBC padding
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
  }
  double duration = now() - enc_start;
  cout << "Encryption time: " << duration/iterations << endl;

  double dec_start = now();
  for (uint32_t i = 0; i < iterations; i++) {
    decryptedtext_len = aes_decrypt(ciphertext, ciphertext_len, key, iv,
                                    decryptedtext);
  }
  double duration2 = now() - dec_start;
  cout << "Decryption time: " << duration2/iterations << endl;

  decryptedtext[decryptedtext_len] = '\0';

  // uncomment to check if decrypted text is correct
  //printf("Decrypted text is:\n");
  //printf("%s\n", decryptedtext);

  /* Clean up */
  EVP_cleanup();
  ERR_free_strings();

}

void full_decrypt(char* data, char* kdata, char* ndata, char* hints) {
	vector<string> base64blocks = split(string(data), ',');

	// reconstruct k and n
	unsigned char temp_k[Scalar::SER_BYTES];
	unsigned char temp_n[Scalar::SER_BYTES];
	base64_decode(string(kdata), temp_k);
	base64_decode(string(ndata), temp_n);
	Scalar k;
	decaf_bool_t result = Scalar::decode(k, temp_k);
	//add by wwh
	cout << result << endl;
	Scalar n;
	decaf_bool_t result2 = Scalar::decode(n, temp_n);
	cout << result2 << endl;
	// decode hints
	unsigned char* hints2 = new unsigned char[base64blocks.size()];
	unsigned char temp_buf[Scalar::SER_BYTES];
	base64_decode(string(hints), hints2);
	string first_decrypt = "";
	for (size_t i = 0; i < base64blocks.size(); i++) {
		SecureBuffer m(BLOCK_SIZE);
		base64_decode(string(base64blocks[i]), temp_buf);
		Point temp_pt(temp_buf);
		decrypt(m, temp_pt, k, n, i, hints2[i]);
		first_decrypt += m.get_string();
	}

	cout << first_decrypt << endl;

}
void full_encrypt(char* data, char* key = NULL) {

	Block message(data);
	int message_blocks = message.size() / BLOCK_SIZE + 1;
	unsigned char* hints = new unsigned char[message_blocks];
	// initiate random number generator
	SpongeRng rng;
	Scalar k(rng);
	unsigned char output_k[Scalar::SER_BYTES];
	if (key != NULL) {
		base64_decode(string(key), output_k);
		decaf_bool_t result3 = Scalar::decode(k, output_k);
		cout << result3 << endl;
	} else {
		k.encode(output_k);
	}

	// generate nonce for the message
	Scalar n(rng);
	unsigned char output_n[Scalar::SER_BYTES];
	n.encode(output_n);

	string output_e;
	unsigned char temp_buf[Scalar::SER_BYTES];
	for (int j = 0; j < message_blocks; j++) {
		size_t len = BLOCK_SIZE;
		if ((j * BLOCK_SIZE + len) >= message.size()) {
			len = message.size() - j * BLOCK_SIZE;
		}
		Point temp_point;
		Block m = message.slice(j * BLOCK_SIZE, len);
		hints[j] = encrypt(temp_point, m, k, n, j);

		temp_point.encode(temp_buf);
		output_e += base64_encode(temp_buf, Scalar::SER_BYTES);
		if (j < message_blocks - 1) {
			output_e += ",";
		}
	}
	string str(hints, hints + message_blocks);
	cout << base64_encode(output_k, Scalar::SER_BYTES) << endl;
	cout << base64_encode(output_n, Scalar::SER_BYTES) << endl;
	cout << str << endl;
	cout << output_e << endl;

	//add by wwh
	cout<<"----------------------"<<endl;
	char* cipher=(char*)output_e.c_str();
	string k_str=base64_encode(output_k, Scalar::SER_BYTES);
	string n_str=base64_encode(output_n, Scalar::SER_BYTES);
	cout<<"k_wwh:"<<k_str.c_str()<<endl;
	cout<<"n_wwh:"<<n_str.c_str()<<endl;
	char* k_wwh=(char*)k_str.c_str();
	char* n_wwh=(char*)n_str.c_str();

	cout<<cipher<<endl;
	cout<<k_wwh<<endl;
	cout<<n_wwh<<endl;
	full_decrypt(cipher,k_wwh,n_wwh,(char*)hints);
}

//void full_encrypt(char* data, char* key = NULL) {
//
//	Block message(data);
//	int message_blocks = message.size() / BLOCK_SIZE + 1;
//	unsigned char* hints = new unsigned char[message_blocks];
//	// initiate random number generator
//	SpongeRng rng;
//	Scalar k(rng);
//	unsigned char output_k[Scalar::SER_BYTES];
//	if (key != NULL) {
//		base64_decode(string(key), output_k);
//		decaf_bool_t result3 = Scalar::decode(k, output_k);
//		cout << result3 << endl;
//	} else {
//		k.encode(output_k);
//	}
//
//	// generate nonce for the message
//	Scalar n(rng);
//	unsigned char output_n[Scalar::SER_BYTES];
//	n.encode(output_n);
//
//	string output_e;
//	unsigned char temp_buf[Scalar::SER_BYTES];
//	for (int j = 0; j < message_blocks; j++) {
//		size_t len = BLOCK_SIZE;
//		if ((j * BLOCK_SIZE + len) >= message.size()) {
//			len = message.size() - j * BLOCK_SIZE;
//		}
//		Point temp_point;
//		Block m = message.slice(j * BLOCK_SIZE, len);
//		hints[j] = encrypt(temp_point, m, k, n, j);
//
//		temp_point.encode(temp_buf);
//		output_e += base64_encode(temp_buf, Scalar::SER_BYTES);
//		if (j < message_blocks - 1) {
//			output_e += ",";
//		}
//	}
//	string str(hints, hints + message_blocks);
//	cout << base64_encode(output_k, Scalar::SER_BYTES) << endl;
//	cout << base64_encode(output_n, Scalar::SER_BYTES) << endl;
//	cout << str << endl;
//	cout << output_e << endl;
//}

bool full_test() {
	return true;
}

//int main(int argc, char** argv) {
//
//  /* Example code
//  SpongeRng rng;
//  Scalar k(rng);
//  unsigned char buf[Scalar::SER_BYTES];
//  k.encode(buf);
//
//  cout << base64_encode(buf, Scalar::SER_BYTES);*/
//
//  // eflag for encrypt, dflag for decrypt, rflag for rekey
//  int eflag = 0;
//  int dflag = 0;
//  int rflag = 0;
//  int kflag = 0;
//  int bflag = 0;
//  char* data = NULL;
//  char* hdata = NULL;
//  char* kdata = NULL;
//  char* ndata = NULL;
//  int c;
//
//  while((c = getopt(argc, argv, "bd:e:r:h:n:k:")) != -1) {
//    switch (c) {
//      case 'e':
//        eflag = 1;
//        data = optarg;
//        break;
//      case 'd':
//        dflag = 1;
//        data = optarg;
//        break;
//      case 'r':
//        rflag = 1;
//        break;
//      case 'h':
//        hdata = optarg;
//        break;
//      case 'n':
//        ndata = optarg;
//        break;
//      case 'k':
//        kflag = 1;
//        kdata = optarg;
//        break;
//      case 'b':
//        bflag = 1;
//        break;
//    }
//  }
//
//  // Do encryption, output key, and send encrypted data
//  // to the storage provider
//  if (eflag == 1) {
//    // read data from file if option is "blah"
//    if (strcmp(data, "blah") == 0) {
//      ifstream t;
//      int length;
//      t.open("encrypted.txt");
//      t.seekg(0, ios::end);
//      length = t.tellg();
//      t.seekg(0, ios::beg);
//      data = new char[length];
//      t.read(data, length);
//      t.close();
//    }
//
//    if (kflag == 1) {
//      full_encrypt(data, kdata);
//    } else {
//      full_encrypt(data);
//    }
//  } else if (dflag == 1) {
//    if (strcmp(data, "blah") == 0) {
//      ifstream t;
//      int length;
//      t.open("encrypted.txt");
//      t.seekg(0, ios::end);
//      length = t.tellg();
//      t.seekg(0, ios::beg);
//      data = new char[length];
//      t.read(data, length);
//      t.close();
//    }
//   // Do decryption
//    full_decrypt(data, kdata, ndata, hdata);
//  } else if (bflag == 1) {
//    const uint32_t message_size = 1000*100;
//    cout << "Message_size: " << message_size << endl;
//    // Starting parameters for the crypto
//    char test_string[message_size + 1];
//    gen_random(test_string, message_size);
//    // null terminate string
//    test_string[message_size] = 0;
//    run_benchmarks(test_string);
//  }
//
//
//  /*bool test1 = basic_test();
//  if (test1) {
//    cout << "Basic test passed!" << endl;
//  } else {
//    cout << "Basic test FAILED!" << endl;
//  }
//
//  const uint32_t message_size = 1024*10;
//  cout << "Message_size: " << message_size << endl;
//  // Starting parameters for the crypto
//  char test_string[message_size + 1];
//  gen_random(test_string, message_size);
//  // null terminate string
//  test_string[message_size] = 0;
//  run_benchmarks(test_string);
//
//  // test string without null terminator for encryption
//  char test_string2[message_size];
//  memcpy(test_string2, test_string, message_size);
//  aes_benchmark((unsigned char*) test_string2);
//  return 1;*/
//
//}
