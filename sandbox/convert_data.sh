#! /bin/zsh

#! /bin/zsh

datasets=('bonsai-master/sandbox/data/rapt')

FULL=bonsai-master/tools

for dataset in ${datasets}; do
    dir=${dataset}

    echo ${dir}

    if [ ! -f ${dir}/trn_X_Y.txt ]; then
    echo "kati"
    echo  ${dir}/train_bow.txt
	perl ${FULL}/convert_format.pl\
	     ${dir}/train_bow.txt\
	     ${dir}/trn_X_Xf.txt\
	     ${dir}/trn_X_Y.txt
    fi
    echo ${FULL}/convert_format.pl
    if [ ! -f ${dir}/tst_X_Y.txt ]; then  
    # echo ${FULL}/convert_format.pl 
	perl ${FULL}/convert_format.pl\
	     ${dir}/test_bow.txt\
	     ${dir}/tst_X_Xf.txt\
	     ${dir}/tst_X_Y.txt
    fi
dataset2=('bonsai-master/sandbox')
    python3 ${dataset2}/label_append_train.py ${dataset}
done