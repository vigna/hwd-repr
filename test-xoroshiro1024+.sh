#!/bin/bash

gcc $@ hwd.c -DXOROSHIRO1024PLUS -DA=25 -DB=27 -DC=36 -DHWD_BITS=64 -DHWD_DIM=16 -o hwd64[16]-xoroshiro1024+ -lm -O3

./hwd64[16]-xoroshiro1024+ -t --progress --low-pv=1e-20 1E15 >hwd64[16]-xoroshiro1024+.txt
