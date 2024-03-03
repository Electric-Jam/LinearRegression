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
Rscript LR.R --bfile /home/parkej95/CSE_284_Sim/simulate.100 --pheno /home/parkej95/CSE284_phenotype/100_samples/100_samples_set_1.pheno --covar /home/parkej95/CSE_284_Sim/simulate.100.eigenvec --out test
```