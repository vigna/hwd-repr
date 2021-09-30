#!/bin/bash

pushd dcmt-master/lib
make
popd

gcc $@ hwd.c -DDYNMT -DMT_BITS=607 -DDC_INIT=5 -DHWD_BITS=32 -DHWD_DIM=19 -o hwd32[19]-dynmt607-5 -lm -Ldcmt-master/lib -ldcmt -O3 -DMAX_BATCH_SIZE=1E8

./hwd32[19]-dynmt607-5 --progress --low-pv=1e-20 1E15 >hwd32[19]-dynmt607-5.txt
