FILE=files_to_be_compressed/xor40.txt
BASE=${FILE##*/}
BASE=${BASE%.*}

PRNN=biGRU_jump
ARNN=biGRU_big
JOINT=_

python run.py --file_name $FILE

python train_PRNN.py --file_name $BASE --model $PRNN
python train_ARNN.py --file_name $BASE --PRNN $PRNN --ARNN $ARNN
