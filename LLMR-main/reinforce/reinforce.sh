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
reward_model=/your/path/to/reward_model



mkdir -p $SAVE
cp $0 $SAVE/

python reinforce.py \
  # -d $DATA \
  # -cn $CONFIG \
  # -tn $TOKENIZER \
  # -s src src \
  # --max-tokens \
  # --num-training-steps  \
  # -lr  \
  # --num-warmup-steps  \
  # --iter-per-update  \
  # --save-dir $SAVE \
  # -mn $MODEL \
  # --reward-model $reward_model \
  # --topk \
  # --scheduler constant\
  # --max-norm  \
  # --softmax \
  # --fp32 \
  # --entropy \
  # --denom \
  # --deterministic \
  # --reward-clip \
  # --template templates/dialogue_T0.txt \
  # --update-per-save \
  # --update-per-log  \
  # | tee -a $SAVE/train.log
