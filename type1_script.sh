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

    mkdir -p /home/eup009/cse284/logs/${sample}
    mkdir -p /home/eup009/cse284/output/${sample}

    for seed in {1..100}
    do
        /usr/bin/time Rscript /home/eup009/cse284/LinearRegression/LR.R \
        --bfile /home/eup009/cse284/CSE_284_Sim/simulate.${sample_1} \
        --covar /home/eup009/cse284/CSE_284_Sim/simulate.${sample_1}.eigenvec \
        --pheno /home/eup009/cse284/CSE284_phenotype/${sample}_samples/${sample}_samples_set_${seed}.pheno \
        --out /home/eup009/cse284/output/${sample}/LM_res_seed${seed} \
        > /home/eup009/cse284/logs/${sample}/LM_res_seed${seed}.log 2>&1 &

        if (( seed % pf == 0 )); then
            wait
        fi
    done


done