#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
data=dd
dataset=/your/path/to/dataset
model= /your/path/to/model
src=src
tgt=tgt

ckpt=checkpoint_best.pt
op=$model/$ckpt/test.tgt
python decoding.py --max-length-a 3 --max-sentences 64 --do-sample --top-k 1 -i $dataset/test.src -mn $model/$ckpt -o $op
echo $ckpt $dataset >> $model/test.$data.log
python metrics.py --lowercase --gen $op --ref $dataset/test.$tgt --src $dataset/test.$src >> $model/test.$data.log

