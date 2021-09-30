Replication code
================

The code in this archive can be used to replicate the results of the
paper “A New Test for Hamming–Weight Dependencies”, by David Blackman and
Sebastiano Vigna.

The tests described in the paper can be replicated in sequence using the
script `test-all.sh`. To speed up the process, the script has been broken
into several subscripts, each testing a different generator; such scripts
can be run in a parallel or distributed fashion. Note that some of the
slowest tests (e.g., for `well512a`) requires months to be completed.

All scripts make it possible to append arguments that will be passed to
the compilter. If you are running on a Linux distribution supporting huge
pages, giving the option `-DHWD_MMAP` will enable huge pages.

`hwd.c` is the code for the test described in the paper. With respect to
the official distribution, it contains some additional conditionally
compiled code in `main()` to initialize a few generators that cannot be
initialized statically. `prng_hwd.c` contain the code for the generators
to be tested: each generator can be selected with a `#define`.

After a test is completed, a p-value smaller than 10^-20 is printed. The
faulty signature can be easily spotted by checking which signature has the
lowest p-value. Note that in a few cases the amount of data quoted in the
paper is slightly smaller than the one in the final output because looking
at previous outputs one can realize that there is a better approximation.
