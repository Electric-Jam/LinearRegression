#For type1 error

basedir=$1
outbase=$2
regpath=$3

mkdir -p $outbase/CSE284_phenotype_1/100_samples
mkdir -p $outbase/CSE284_phenotype_1/1k_samples
mkdir -p $outbase/CSE284_phenotype_1/10k_samples

Rscript $regpath/phenotype_generation_1.R \
--fam $basedir/simulate.100.fam \
--n_phenotypes 100 \
--out $outbase/CSE284_phenotype_1/100_samples


Rscript $regpath/phenotype_generation_1.R \
--fam $basedir/simulate.1000.fam \
--n_phenotypes 100 \
--out $outbase/CSE284_phenotype_1/1k_samples


Rscript $regpath/phenotype_generation_1.R \
--fam $basedir/simulate.10000.fam \
--n_phenotypes 100 \
--out $outbase/CSE284_phenotype_1/10k_samples


#For type2 error

mkdir -p $outbase/CSE284_phenotype_2/100_samples
mkdir -p $outbase/CSE284_phenotype_2/1k_samples
mkdir -p $outbase/CSE284_phenotype_2/10k_samples

Rscript $regpath/phenotype_generation_2.R \
--bfile $basedir/simulate.100 \
--n_phenotypes 100 \
--n_negative_causal_variants 100 \
--n_positive_causal_variants 100 \
--negative_beta_min -1 \
--negative_beta_max -0.5 \
--positive_beta_min 1 \
--positive_beta_max 2 \
--out $outbase/CSE284_phenotype_2/100_samples

Rscript $regpath/phenotype_generation_2.R \
--bfile $basedir/simulate.1000 \
--n_phenotypes 100 \
--n_negative_causal_variants 100 \
--n_positive_causal_variants 100 \
--negative_beta_min -1 \
--negative_beta_max -0.5 \
--positive_beta_min 1 \
--positive_beta_max 2 \
--out $outbase/CSE284_phenotype_2/1k_samples

Rscript $regpath/phenotype_generation_2.R \
--bfile $basedir/simulate.10000 \
--n_phenotypes 100 \
--n_negative_causal_variants 100 \
--n_positive_causal_variants 100 \
--negative_beta_min -1 \
--negative_beta_max -0.5 \
--positive_beta_min 1 \
--positive_beta_max 2 \
--out $outbase/CSE284_phenotype_2/10k_samples

