BERT_DATA_PATH=/turing-nfs/users/zhunliu/datasets/bert_data_cnndm_final/cnndm
MODEL_PATH=/turing-nfs/users/zhunliu/dump/bertsum_checkpoints/$2
WEIGHTS_PATH=/turing-nfs/users/zhunliu/dump/checkpoints/tnlrv3/tnlrv3-large-uncased.pt

mkdir -p $MODEL_PATH
mkdir -p ../logs/$2

    # -visible_gpus 0,1,2,3,4,5,6,7 \
PYTHONIOENCODING=utf8 \
python \
    train.py \
    -task ext \
    -mode train \
    -bert_data_path $BERT_DATA_PATH \
    -model_type tnlrv3-large-uncased \
    -sparse true \
    -weights_path $WEIGHTS_PATH \
    -ext_dropout 0.1 \
    -model_path $MODEL_PATH \
    -lr 2e-3 \
    -visible_gpus 0,1,2,3,4,5 \
    -report_every 50 \
    -save_checkpoint_steps 1000 \
    -batch_size 3000 \
    -checkpoint_segment -1 \
    -train_steps 50000 \
    -accum_count 1 \
    -log_file ../logs/$2/run.log \
    -use_interval true \
    -warmup_steps 10000 \
    -max_pos $1
