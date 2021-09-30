#!/bin/bash

gcc $@ hwd.c -DWELL512A -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-well512a -lm -O3

./hwd32[16]-well512a --progress --low-pv=1e-20 1E15 >hwd32[16]-well512a.txt
