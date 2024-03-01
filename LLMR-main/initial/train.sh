#!/bin/bash

export CUDA_VISIBLE_DEVICES=0
export TRANSFORMERS_OFFLINE=1


export MASTER_ADDR=127.0.0.1
export MASTER_PORT=$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')

export NCCL_DEBUG=INFO



NAME=your_model_name


MODEL=/your/path/to/model
DATA=/your/path/to/dataset
CONFIG=/your/path/to/config
TOKENIZER=/your/path/to/tokenizer
SAVE=/your/path/to/save/${NAME}

mkdir -p $SAVE
cp $0 $SAVE/

python train.py \
#  -d $DATA \
#  -cn $CONFIG \
#  -tn $TOKENIZER \
#  -s src tgt \
#  --max-tokens  \
#  --num-training-steps \
#  -lr  \
#  --num-warmup-steps  \
#  --iter-per-update  \
#  --save-dir $SAVE \
#  --update-per-save  \
#  -mn $MODEL \
#  --fp32 \
#  --label-smoothing  \
#  | tee -a $SAVE/train.log
