#!/bin/bash

gcc $@ hwd.c -DSFMT607 -DHWD_BITS=64 -DHWD_DIM=12 -o hwd64[12]-sfmt607 -lm -O3

./hwd64[12]-sfmt607 --progress --low-pv=1e-20 1E15 >hwd64[12]-sfmt607.txt
