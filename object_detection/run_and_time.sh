#!/bin/bash

# Runs benchmark and reports time to convergence

pushd pytorch

# Single GPU training
export NGPUS=4
DIST="-m torch.distributed.launch --nproc_per_node=$NGPUS"
time python ${DIST} tools/train_mlperf.py --config-file "configs/e2e_mask_rcnn_R_50_FPN_1x.yaml" \
       SOLVER.IMS_PER_BATCH ${NGPUS} TEST.IMS_PER_BATCH ${NGPUS} SOLVER.MAX_ITER 720000 SOLVER.STEPS "(480000, 640000)" SOLVER.BASE_LR 0.0025

popd
