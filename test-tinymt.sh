#!/bin/bash

gcc $@ hwd.c TinyMT/tinymt/tinymt64.c -DTINYMT64 -DMAT1=0xfa051f40 -DMAT2=0xffd0fff4 -DTMAT=0x58d02ffeffbfffbc -DHWD_BITS=32 -DHWD_PRNG_BITS=64 -DHWD_DIM=8 -o hwd32[8]-tinymt64 -lm -O3

./hwd32[8]-tinymt64 --progress --low-pv=1e-20 1E15 >hwd32[8]-tinymt64.txt
