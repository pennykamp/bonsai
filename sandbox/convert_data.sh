#! /bin/zsh

#! /bin/zsh

datasets=('bonsai-master/sandbox/data/eurlex')

FULL=bonsai-master/tools

for dataset in ${datasets}; do
    echo ${dataset}
    dir=${dataset}

    echo ${dir}

    if [ ! -f ${dir}/trn_X_Y.txt ]; then
    echo "kati"
	perl ${FULL}/convert_format.pl\
	     ${dataset}/eurlex_train.txt\
	     ${dir}/trn_X_Xf.txt\
	     ${dir}/trn_X_Y.txt
    fi
    echo ${FULL}/convert_format.pl
    if [ ! -f ${dir}/tst_X_Y.txt ]; then  
    echo ${FULL}/convert_format.pl 
	perl ${FULL}/convert_format.pl\
	     ${dataset}/eurlex_test.txt\
	     ${dir}/tst_X_Xf.txt\
	     ${dir}/tst_X_Y.txt
    fi
dataset2=('bonsai-master/sandbox')
    python3 ${dataset2}/label_append_train.py ${dataset}
done