#!/bin/bash

pushd dcmt-master/lib
make
popd

gcc $@ hwd.c -DDYNMT -DMT_BITS=521 -DDC_INIT=1 -DHWD_BITS=32 -DHWD_DIM=16 -o hwd32[16]-dynmt521-1 -lm -Ldcmt-master/lib -ldcmt -O3

./hwd32[16]-dynmt521-1 --progress --low-pv=1e-20 1E15 >hwd32[16]-dynmt521-1.txt
