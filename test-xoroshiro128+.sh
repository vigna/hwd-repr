#!/bin/bash

gcc $@ hwd.c -DXOROSHIRO128PLUS -DA=24 -DB=16 -DC=37 -DHWD_BITS=64 -DHWD_DIM=8 -o hwd64[8]-xoroshiro128+ -lm -O3

./hwd64[8]-xoroshiro128+ -t --progress --low-pv=1e-20 1E15 >hwd64[8]-xoroshiro128+.txt
