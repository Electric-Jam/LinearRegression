# Motivation of the project
A [study](https://www.nature.com/articles/s41588-018-0144-6) demonstrated that Linear Mixed Models (LMMs) have improved power in detecting effects when compared to linear regression models(LMs). However, this study does not extend its comparison to the inflation of Type I errors between these methodologies. Given the trade-off between Type I and Type II errors in statistical analyses, the absence of such a comparison leaves a gap in our understanding. Therefore, our project proposes an investigation into the statistical
errors by LMMs and LMs. By systematically comparing the Type I and Type II error rates of both
models, this project aims to illuminate their statistical efficacy and robustness.


# Genotype simulation
Since the genotype data is not available, we will simulate the genotype data using `plink` software. The genotype data will be simulated for 100, 1k, 10k samples and linkage equlibrium 10k SNPs. The genotype data will be simulated using the following command:

```
bash simulate_bed_files.sh $BASEDIR
```

Genetic PCA was performed to generate the covariate file for the linear regression model. The genetic PCA was performed using the following command:

```
bash generate_pcs.sh $BASEDIR
```

# Phenotype simulation
Two different sets of phenotypes were generated for each sample size. The first set of phenotypes was generated for type 1 error evaluation and the second set of phenotypes was generated for type 2 error evaluation.

## Null phenotype generation
100 null phenotypes for type 1 error evaluation were generated using `phenotype_generation.R` script.

### Dependencies
-`argparser`
-`data.table`

### Input Files
-`fam` : plink fam file
-`n_phenotypes` : number of phenotypes to generate
-`out` : output file prefix

The script was run using the following command:

```
bash phenotype_generation.sh
```

## Causal phenotype generation

The second set of phenotypes was generated for type 2 error evaluation using the following command:

```bash

```

# Simple Linear Regression for GWAS
The simple linear regression model is implemented in the attached `LR.R` file. The file is implemented using the following dependencies

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


## Example Command Line Usage
```
Rscript /home/eup009/cse284/LinearRegression/LR.R \
        --bfile /home/eup009/cse284/CSE_284_Sim/simulate.100 \
        --covar /home/eup009/cse284/CSE_284_Sim/simulate.100.eigenvec \
        --pheno /home/eup009/cse284/CSE284_phenotype/${sample}_samples/100_samples_set_1.pheno \
        --out /home/eup009/cse284/output/${sample}/LM_res_seed${seed}
```

# Linear Mixed Model for GWAS (EMMAX)
To test the Linear Mixed Model, we used the EMMAX software. EMMAX is a mixed model association test that accounts for population structure and relatedness. EMMAX uses a linear mixed model to account for the relatedness between individuals. The EMMAX software was used to compute the association study across all simulated phenotypes. 

## Download & Installation of EMMAX
Pre-compiled executable source: https://csg.sph.umich.edu//kang/emmax/download/index.html


## Generate kinship matrices by samplesize
```
bash make_IBS_matrices.sh $BASEDIR $EMMAX_KIN_PATH $OUTBASE
```

## Compute association study across all simulated phenotypes
```
bash run_association.sh $BASEDIR $PHENOBASE $OUTBASE $EMMAX_KIN_PATH $EMMAX_PATH
```



# Type I error Evaluation
The type I error evaluation was performed by the False Positive Rate (FPR) of the linear regression model and the linear mixed model. Furthermore, the p-value distribution was plotted in a qqplot to visualize the inflation of the p-values. qqplot was generated using the `plot_res.R` script.

```
Rscript plot_res.R
Rscript plot_res_emmax.R
```

# Type II Evaluation

# Computational Cost Evaluation


# Conclusion
