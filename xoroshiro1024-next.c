/*

This code implements multiplication by the matrix underlying a xoroshiro1024 generator.
It assumes that the state has been declared as

uint64_t s[16];

The standard implementation uses multiple assignments. If XOROSHIRO_USE_P
has been defined, a rotating index p will be used to avoid assignements,
instead. It requires the further declaration

int p;

The parameters that must be defined are:

- A: the first rotation (left).
- B: the shift (left).
- C: the second rotation (left).

*/

#ifdef XOROSHIRO_USE_P

const int q = p;
const uint64_t s0 = s[p = (p + 1) & 15];
uint64_t s15 = s[q];
const uint64_t result_plus = s0 + s15;
const uint64_t result_star = s0 * 0x9e3779b97f4a7c13;

#ifdef R
const uint64_t result_pp = rotl(result_plus, R) + s15;
#endif

#if defined(S) && defined (R) && defined(T)
const uint64_t result_ss = rotl(s0 * S, R) * T;
#endif

s15 ^= s0;
s[q] = rotl(s0, A) ^ s15 ^ (s15 << B);
s[p] = rotl(s15, C);

#else

const uint64_t s0 = s[0];
uint64_t s15 = s[15];
const uint64_t result_plus = s0 + s15;
const uint64_t result_star = s0 * 0x9e3779b97f4a7c13;

#ifdef R
const uint64_t result_pp = rotl(result_plus, R) + s15;
#endif

#if defined(S) && defined (R) && defined(T)
const uint64_t result_ss = rotl(s0 * S, R) * T;
#endif


s15 ^= s0;
s[0] = s[1];
s[1] = s[2];
s[2] = s[3];
s[3] = s[4];
s[4] = s[5];
s[5] = s[6];
s[6] = s[7];
s[7] = s[8];
s[8] = s[9];
s[9] = s[10];
s[10] = s[11];
s[11] = s[12];
s[12] = s[13];
s[13] = s[14];
s[14] = rotl(s0, A) ^ s15 ^ (s15 << B);
s[15] = rotl(s15, C);

#endif
