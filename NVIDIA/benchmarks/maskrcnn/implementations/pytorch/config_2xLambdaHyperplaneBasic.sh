#!/bin/bash

## DL params
EXTRA_PARAMS=""
EXTRA_CONFIG=(
               "SOLVER.BASE_LR"       "0.12"
               "SOLVER.MAX_ITER"      "42000"
               "SOLVER.WARMUP_FACTOR" "0.000192"
               "SOLVER.WARMUP_ITERS"  "625"
               "SOLVER.WARMUP_METHOD" "mlperf_linear"
               "SOLVER.STEPS"         "(12000, 16000)"
               "SOLVER.IMS_PER_BATCH"  "96"
               "TEST.IMS_PER_BATCH" "16"
               "MODEL.RPN.FPN_POST_NMS_TOP_N_TRAIN" "6000"
               "NHWC" "True"
             )

## System run parms
DGXNNODES=2
DGXSYSTEM=$(basename $(readlink -f ${BASH_SOURCE[0]}) | sed 's/^config_//' | sed 's/\.sh$//' )
WALLTIME=08:00:00

## System config params
DGXNGPU=8
DGXSOCKETCORES=20
DGXNSOCKET=2
DGXHT=2 	# HT is on is 2, HT off is 1
DGXIBDEVICES='--device=/dev/infiniband/rdma_cm --device=/dev/infiniband/ucm3 --device=/dev/infiniband/ucm2 --device=/dev/infiniband/ucm1 --device=/dev/infiniband/ucm0 --device=/dev/infiniband/uverbs3 --device=/dev/infiniband/uverbs2 --device=/dev/infiniband/uverbs1 --device=/dev/infiniband/uverbs0 --device=/dev/infiniband/issm3 --device=/dev/infiniband/umad3 --device=/dev/infiniband/issm2 --device=/dev/infiniband/umad2 --device=/dev/infiniband/issm1 --device=/dev/infiniband/umad1 --device=/dev/infiniband/issm0 --device=/dev/infiniband/umad0'
BIND_LAUNCH=1