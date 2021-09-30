#!/bin/bash

gcc $@ hwd.c -DXORSHIFT1024 -DA=31 -DB=11 -DC=30 -DHWD_BITS=64 -DHWD_DIM=16 -o hwd64[16]-xorshift1024 -lm -O3 -DMAX_BATCH_SIZE=1E7

./hwd64[16]-xorshift1024 --progress --low-pv=1e-20 1E15 >hwd64[16]-xorshift1024.txt
