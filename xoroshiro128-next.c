/*

This code implements multiplication by the matrix underlying a xoroshiro128 generator.
It assumes that the state has been declared as

uint64_t s[2];

The parameters that must be defined are:

- A: the first rotation (left).
- B: the shift (left).
- C: the second rotation (left).

*/

const uint64_t s0 = s[0];
uint64_t s1 = s[1];

const uint64_t result_plus = s0 + s1;

#ifdef R
const uint64_t result_pp = rotl(result_plus, R) + s0;
#endif

#if defined(S) && defined (R) && defined(T)
const uint64_t result_ss = rotl(s0 * S, R) * T;
#endif

const uint64_t result_star = s0 * 0x9e3779b97f4a7c13;

s1 ^= s0;
s[0] = rotl(s0, A) ^ s1 ^ (s1 << B);
s[1] = rotl(s1, C);
