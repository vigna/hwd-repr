/*

This code implements multiplication by the matrix underlying a xorshift128 generator.
It assumes that the state has been declared as

uint64_t s[2];

The parameters that must be defined are:

- A: the first shift (left).
- B: the second shift (right).
- C: the third shift (right).

*/

uint64_t s1 = s[0];
const uint64_t s0 = s[1];
const uint64_t result = s0 + s1; // For backward compatibility
const uint64_t result_plus = s0 + s1;
#if defined(S) && defined (R) && defined(T)
const uint64_t result_ss = rotl(s0 * S, R) * T;
#endif
#if defined(S) && defined(T)
uint64_t result_sxs = s0 * S;
result_sxs ^= result_sxs >> 32;
result_sxs *= T;
#endif

s[0] = s0;
s1 ^= s1 << A;
s[1] = s1 ^ s0 ^ (s1 >> B) ^ (s0 >> C);
