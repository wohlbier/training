#!/bin/bash

set -e

DATASET_DIR='/pylon5/cc5phsp/wohlbier/mlperf/training/rnn_translator/data'

SEED=${1:-"1"}
TARGET=${2:-"24.00"}

# run training
python3 train.py \
  --dataset-dir ${DATASET_DIR} \
  --seed $SEED \
  --target-bleu $TARGET
