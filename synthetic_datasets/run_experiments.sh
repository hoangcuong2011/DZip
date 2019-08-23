
vals=( 10 20 30 40 50 60)
models=( "biGRU" "biGRU_stack" "biGRU_jump" "FC" )
for i in "${vals[@]}"
do
	python run.py --file_name files_to_be_compressed/xor$i.txt
	for m in "${models[@]}"
	do
		python direct_exp.py --file_name xor$i.txt --log_file logs.csv --model $m
	done
done

python run.py --file_name files_to_be_compressed/iid.txt
for m in "${models[@]}"
do
	python direct_exp.py --file_name iid.txt --log_file logs.csv --model $m
done

