# Characterizing Type I Error Trade-off between LMMs and Linear Models

# Data Generation

## Dependencies
-`plink v1.90b6.9`


## 1. Generate Genotypes using Plink --simulate, transpose for use in EMMAX
```
bash simulate_bed_files.sh $BASEDIR
```

## 2. Generate Covariates using Plink --pcs
```
bash generate_pcs.sh $BASEDIR
```

## 3. Generate Phenotypes
```
bash phenotype_generation.sh
```

# Run association on simulated samples using EMMAX LMM

## 1. Download EMMAX
Pre-compiled executable source: https://csg.sph.umich.edu//kang/emmax/download/index.html


## 2. Generate kinship matrices by samplesize
```
bash make_IBS_matrices.sh $BASEDIR $EMMAX_KIN_PATH $OUTBASE
```

## 3. Compute association study across all simulated phenotypes
```
bash run_association.sh $BASEDIR $PHENOBASE $OUTBASE $EMMAX_KIN_PATH $EMMAX_PATH
```

## 4. Generate samplesize-wise QQ-Plots
```
Rscript plot_res_emmax.R
```

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
