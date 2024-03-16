#!/bin/sh

basedir=$1
phenobase=$2
outbase=$3
regpath=$4

for sample in 100 1k 10k 
do
    if [ "${sample}" == "100" ]; then
            sample_1="100"
            pf=50
        fi
    if [ "${sample}" == "1k" ]; then
            sample_1="1000"
            pf=30
        fi
    
    if [ "${sample}" == "10k" ]; then
            sample_1="10000"
            pf=10
        fi

    if [ "${sample}" == "50k" ]; then
            sample_1="50000"
            pf=2
        fi

    mkdir -p $outbase/logs/${sample}
    mkdir -p $outbase/output/${sample}

    for seed in {1..100}
    do
        echo $outbase/output/${sample}/LM_res_seed${seed} 
	Rscript $regpath/LR.R \
        --bfile $basedir/simulate.$sample_1 \
        --pheno $phenobase/${sample}_samples/${sample}_samples_set_${seed}.pheno \
        --out $outbase/output/${sample}/LM_res_seed${seed} \
        > $outbase/logs/${sample}/LM_res_seed${seed}.log 2>&1 &

        if (( seed % pf == 0 )); then
            wait
        fi
    done


done
