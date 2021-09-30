#!/bin/bash

gcc $@ hwd.c -DDSFMT521 -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-dsfmt521 -lm -O3

./hwd32[16]-dsfmt521 --progress --low-pv=1e-20 1E15 >hwd32[16]-dsfmt521.txt
