#!/bin/bash
export CUDA_VISIBLE_DEVICES=1
data=cnn
dataset=/your/path/to/dataset
model=/your/path/to/model
src=src
tgt=tgt

ckpt='your_ckpt'
op=$model/$ckpt/test.tgt
python decoding.py --max-length-a 3 --max-sentences 16 --do-sample --top-k 1 -i $dataset/test.src -mn $model/$ckpt -o $op
echo $ckpt $dataset >> $model/test.$data.log
python metrics.py --lowercase --rouge --gen $op --ref $dataset/test.$tgt --src $dataset/test.$src >> $model/test.$data.log
