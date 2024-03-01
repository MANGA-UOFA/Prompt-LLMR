#!/bin/bash

export CUDA_VISIBLE_DEVICES=0


data=ost
dataset=/your/path/to/dataset
model=/your/path/to/model
src=src
tgt=tgt

for ckpt in `ls $model`
do
    op=$model/$ckpt/valid.tgt
    python decoding.py --max-length-a 3 --max-sentences 64 --do-sample --top-k 1 -i $dataset/valid.src -mn $model/$ckpt -o $op
    echo $ckpt $dataset >> $model/valid.$data.log
    python metrics.py --lowercase --gen $op --ref $dataset/valid.$tgt --src $dataset/valid.$src >> $model/valid.$data.log
done
  