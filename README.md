# Simple Linear Regression for GWAS

## Dependencies (built with R3.6.3)
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
Rscript LR.R --bfile ps2_admixture.pruned --pheno test_pheno.pheno --covar test_pheno.covar --out test
```