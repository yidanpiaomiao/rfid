#ifndef REVOCATION_H
#define REVOCATION_H
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>

#include "decaf.hxx"
#include "shake.hxx"


using namespace decaf;
typedef Ed448::Scalar Scalar;
typedef Ed448::Point Point;
#endif
