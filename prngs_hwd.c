#define ROTL64 static inline uint64_t rotl(const uint64_t x, int k) { return (x << k) | (x >> (64 - k)); }
#define ROTL32 static inline uint32_t rotl(const uint32_t x, int k) { return (x << k) | (x >> (32 - k)); }

#if defined(XORSHIFT128)

static uint64_t s[2] = { 1, -1ULL };
static uint64_t inline next() {
#include "xorshift128-next.c"
		return s0;
}

#elif defined(XORSHIFT128PLUS)

static uint64_t s[2] = { 1, -1ULL };
static uint64_t inline next() {
#include "xorshift128-next.c"
		return result_plus;
}

#elif defined(XORSHIFT1024)

int p;
static uint64_t s[16] = { 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL };
static uint64_t inline next() {
#include "xorshift1024-next.c"
		return s0;
}

#elif defined(XORSHIFT1024PLUS)

int p;
static uint64_t s[16] = { 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL };
static uint64_t inline next() {
#include "xorshift1024-next.c"
		return result_plus;
}

#elif defined(XOROSHIRO128)

ROTL64

static uint64_t s[2] = { 1, -1ULL };
static uint64_t inline next() {
#include "xoroshiro128-next.c"
		return s0;
}

#elif defined(XOROSHIRO128PLUS)

ROTL64

static uint64_t s[2] = { 1, -1ULL };
static uint64_t inline next() {
#include "xoroshiro128-next.c"
		return result_plus;
}

#elif defined(XOROSHIRO1024)

ROTL64

int p;
static uint64_t s[16] = { 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL };
static uint64_t inline next() {
#define XOROSHIRO_USE_P
#include "xoroshiro1024-next.c"
		return s0;
}

#elif defined(XOROSHIRO1024PLUS)

ROTL64

int p;
static uint64_t s[16] = { 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL, 1, -1ULL };
static uint64_t inline next() {
#define XOROSHIRO_USE_P
#include "xoroshiro1024-next.c"
		return result_plus;
}

#elif defined(DSFMT521)

#define DSFMT_MEXP (521)
#define HAVE_SSE3

#include "dSFMT/dSFMT.h"
#include "dSFMT/dSFMT.c"

static uint32_t inline next() {
	return dsfmt_gv_genrand_uint32();
}

#elif defined(SFMT607)

#define SFMT_MEXP (607)
#define HAVE_SSE2

#include "SFMT/SFMT.h"
#include "SFMT/SFMT.c"

sfmt_t sfmt = { { { .u64 = { 0xb65496cfd3de7517, 0xf6065582207ab6ce} }, { .u64 = { 0x84cb9313f678ba1a, 0xcfca20c4d51d030f} }, { .u64 = { 0x392bb856f86c3181, 0xfae706525fdb54d8} }, { .u64 = { 0x8897a3429d348281, 0xb22b77c32a64e0bc} }, { .u64 = { 0xd9a56d91dd7760e3, 0x65fec009e89daf5d} } } };

static uint64_t inline next() {
	return sfmt_genrand_uint64(&sfmt);
}

#elif defined(TINYMT64)

#include "TinyMT/tinymt/tinymt64.h"
tinymt64_t tmt;

static uint64_t inline next() {
	return tinymt64_generate_uint64(&tmt);
}

#elif defined(DYNMT)

#include "dcmt-master/include/dc.h"

mt_struct *mts;

static uint32_t inline next() {
	return genrand_mt(mts);
}

#elif defined(WELL512A)

#define W 32
#define R 16
#define P 0
#define M1 13
#define M2 9
#define M3 5

#define MAT0POS(t,v) (v^(v>>t))
#define MAT0NEG(t,v) (v^(v<<(-(t))))
#define MAT3NEG(t,v) (v<<(-(t)))
#define MAT4NEG(t,b,v) (v ^ ((v<<(-(t))) & b))

#define V0            STATE[state_i                   ]
#define VM1           STATE[(state_i+M1) & 0x0000000fU]
#define VM2           STATE[(state_i+M2) & 0x0000000fU]
#define VM3           STATE[(state_i+M3) & 0x0000000fU]
#define VRm1          STATE[(state_i+15) & 0x0000000fU]
#define VRm2          STATE[(state_i+14) & 0x0000000fU]
#define newV0         STATE[(state_i+15) & 0x0000000fU]
#define newV1         STATE[state_i                 ]
#define newVRm1       STATE[(state_i+14) & 0x0000000fU]

#define FACT 2.32830643653869628906e-10

static unsigned int state_i = 0;
static uint32_t STATE[R] = { 0xe0ab0f8f, 0xac13e1ec, 0x1f9ac006, 0x689ef52f, 0xbdcb74dc, 0xc348143, 0x85385443, 0xd26ce381, 0xc77cae8b, 0xc7e8c474, 0xde41d18e, 0xf4c127f1, 0xa018cfa0, 0x61bade34, 0xc5fead5d, 0x30c71bb1 };
static uint32_t z0, z1, z2;

uint32_t next(void){
  z0    = VRm1;
  z1    = MAT0NEG (-16,V0)    ^ MAT0NEG (-15, VM1);
  z2    = MAT0POS (11, VM2)  ;
  newV1 = z1                  ^ z2; 
  newV0 = MAT0NEG (-2,z0)     ^ MAT0NEG(-18,z1)    ^ MAT3NEG(-28,z2) ^ MAT4NEG(-5,0xda442d24U,newV1) ;
  state_i = (state_i + 15) & 0x0000000fU;
  return STATE[state_i];
}

#endif
