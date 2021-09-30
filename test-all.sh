#!/bin/bash

pushd dcmt-master/lib
make
popd

gcc $@ hwd.c -DXORSHIFT128 -DA=23 -DB=18 -DC=5 -DHWD_BITS=64 -DHWD_DIM=8 -o hwd64[8]-xorshift128 -lm -O3

./hwd64[8]-xorshift128 --progress --low-pv=1e-20 1E15 >hwd64[8]-xorshift128.txt


gcc $@ hwd.c -DXORSHIFT128PLUS -DA=23 -DB=18 -DC=5 -DHWD_BITS=64 -DHWD_DIM=8 -o hwd64[8]-xorshift128+ -lm -O3

./hwd64[8]-xorshift128+ -t --progress --low-pv=1e-20 1E15 >hwd64[8]-xorshift128+.txt


gcc $@ hwd.c -DXORSHIFT1024 -DA=31 -DB=11 -DC=30 -DHWD_BITS=64 -DHWD_DIM=16 -o hwd64[16]-xorshift1024 -lm -O3 -DMAX_BATCH_SIZE=1E7

./hwd64[16]-xorshift1024 --progress --low-pv=1e-20 1E15 >hwd64[16]-xorshift1024.txt


gcc $@ hwd.c -DXORSHIFT1024PLUS -DA=31 -DB=11 -DC=30 -DHWD_BITS=64 -DHWD_DIM=16 -o hwd64[16]-xorshift1024+ -lm -O3 -DMAX_BATCH_SIZE=1E8

./hwd64[16]-xorshift1024+ -t --progress --low-pv=1e-20 1E15 >hwd64[16]-xorshift1024+.txt


gcc $@ hwd.c -DXOROSHIRO128 -DA=24 -DB=16 -DC=37 -DHWD_BITS=64 -DHWD_DIM=8 -o hwd64[8]-xoroshiro128 -lm -O3

./hwd64[8]-xoroshiro128 --progress --low-pv=1e-20 1E15 >hwd64[8]-xoroshiro128.txt


gcc $@ hwd.c -DXOROSHIRO128PLUS -DA=24 -DB=16 -DC=37 -DHWD_BITS=64 -DHWD_DIM=8 -o hwd64[8]-xoroshiro128+ -lm -O3

./hwd64[8]-xoroshiro128+ -t --progress --low-pv=1e-20 1E15 >hwd64[8]-xoroshiro128+.txt


gcc $@ hwd.c -DXOROSHIRO1024 -DA=25 -DB=27 -DC=36 -DHWD_BITS=64 -DHWD_DIM=16 -o hwd64[16]-xoroshiro1024 -lm -O3

./hwd64[16]-xoroshiro1024 --progress --low-pv=1e-20 1E15 >hwd64[16]-xoroshiro1024.txt


gcc $@ hwd.c -DXOROSHIRO1024PLUS -DA=25 -DB=27 -DC=36 -DHWD_BITS=64 -DHWD_DIM=16 -o hwd64[16]-xoroshiro1024+ -lm -O3

./hwd64[16]-xoroshiro1024+ -t --progress --low-pv=1e-20 1E15 >hwd64[16]-xoroshiro1024+.txt


gcc $@ hwd.c -DDYNMT -DMT_BITS=521 -DDC_INIT=1 -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-dynmt521-1 -lm -Ldcmt-master/lib -ldcmt -O3

./hwd32[16]-dynmt521-1 --progress --low-pv=1e-20 1E15 >hwd32[16]-dynmt521-1.txt


gcc $@ hwd.c -DDYNMT -DMT_BITS=521 -DDC_INIT=4 -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-dynmt521-4 -lm -Ldcmt-master/lib -ldcmt -O3

./hwd32[16]-dynmt521-4 --progress --low-pv=1e-20 1E15 >hwd32[16]-dynmt521-4.txt


gcc $@ hwd.c -DDYNMT -DMT_BITS=607 -DDC_INIT=5 -DHWD_BITS=32 -DHWD_DIM=19 -o hwd32[19]-dynmt607-5 -lm -Ldcmt-master/lib -ldcmt -O3 -DMAX_BATCH_SIZE=1E8

./hwd32[19]-dynmt607-5 --progress --low-pv=1e-20 1E15 >hwd32[19]-dynmt607-5.txt


gcc $@ hwd.c -DDYNMT -DMT_BITS=607 -DDC_INIT=0 -DHWD_BITS=32 -DHWD_DIM=19 -o hwd32[19]-dynmt607-0 -lm -Ldcmt-master/lib -ldcmt -O3 -DMAX_BATCH_SIZE=1E8

./hwd32[19]-dynmt607-0 --progress --low-pv=1e-20 1E15 >hwd32[19]-dynmt607-0.txt


gcc $@ hwd.c -DSFMT607 -DHWD_BITS=64 -DHWD_DIM=12 -o hwd64[12]-sfmt607 -lm -O3

./hwd64[12]-sfmt607 --progress --low-pv=1e-20 1E15 >hwd64[12]-sfmt607.txt


gcc $@ hwd.c -DDSFMT521 -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-dsfmt521 -lm -O3

./hwd32[16]-dsfmt521 --progress --low-pv=1e-20 1E15 >hwd32[16]-dsfmt521.txt


gcc $@ hwd.c TinyMT/tinymt/tinymt64.c -DTINYMT64 -DMAT1=0xfa051f40 -DMAT2=0xffd0fff4 -DTMAT=0x58d02ffeffbfffbc -DHWD_BITS=32 -DHWD_PRNG_BITS=64 -DHWD_DIM=8 -o hwd32[8]-tinymt64 -lm -O3

./hwd32[8]-tinymt64 --progress --low-pv=1e-20 1E15 >hwd32[8]-tinymt64.txt


gcc $@ hwd.c -DWELL512A -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-well512a -lm -O3

./hwd32[16]-well512a --progress --low-pv=1e-20 1E15 >hwd32[16]-well512a.txt
