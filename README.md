# Simple Linear Regression for GWAS

## Dependencies (built with R4.3.1)
-`argparser`
-`data.table`
-`dplyr`
-`seqminer`


## Input Files

-`bfile` : plink file prefix'
-`pheno` : phenotype file
-`covar` : covariate file
-`out` : output file prefix



## Command Line Usage
```
Rscript /home/eup009/cse284/LinearRegression/LR.R \
        --bfile /home/eup009/cse284/CSE_284_Sim/simulate.${sample_1} \
        --covar /home/eup009/cse284/CSE_284_Sim/simulate.${sample_1}.eigenvec \
        --pheno /home/eup009/cse284/CSE284_phenotype/${sample}_samples/${sample}_samples_set_${seed}.pheno \
        --out /home/eup009/cse284/output/${sample}/LM_res_seed${seed}
```