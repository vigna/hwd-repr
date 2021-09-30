#!/bin/bash

gcc $@ hwd.c -DXORSHIFT128PLUS -DA=23 -DB=18 -DC=5 -DHWD_BITS=64 -DHWD_DIM=8 -o hwd64[8]-xorshift128+ -lm -O3

./hwd64[8]-xorshift128+ -t --progress --low-pv=1e-20 1E15 >hwd64[8]-xorshift128+.txt
