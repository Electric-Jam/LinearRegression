#For type1 error

Rscript /home/eup009/cse284/LinearRegression/phenotype_generation_1.R \
--fam /home/eup009/cse284/100_test.fam \
--n_phenotypes 100 \
--out /home/eup009/cse284/CSE284_phenotype_1/100_samples/100_samples


Rscript /home/eup009/cse284/LinearRegression/phenotype_generation_1.R \
--fam /home/eup009/cse284/1000_test.fam \
--n_phenotypes 100 \
--out /home/eup009/cse284/CSE284_phenotype_1/1k_samples/1k_samples


Rscript /home/eup009/cse284/LinearRegression/phenotype_generation_1.R \
--fam /home/eup009/cse284/10000_test.fam \
--n_phenotypes 100 \
--out /home/eup009/cse284/CSE284_phenotype_1/10k_samples/10k_samples


#For type2 error

mkdir -p /home/eup009/cse284/CSE284_phenotype_2/100_samples
mkdir -p /home/eup009/cse284/CSE284_phenotype_2/1k_samples
mkdir -p /home/eup009/cse284/CSE284_phenotype_2/10k_samples

Rscript /home/eup009/cse284/LinearRegression/phenotype_generation_2.R \
--bfile /home/eup009/cse284/100_test \
--n_phenotypes 100 \
--n_negative_causal_variants 100 \
--n_positive_causal_variants 100 \
--negative_beta_min -1 \
--negative_beta_max -0.5 \
--positive_beta_min 1 \
--positive_beta_max 2 \
--out /home/eup009/cse284/CSE284_phenotype_2/100_samples/100_samples

Rscript /home/eup009/cse284/LinearRegression/phenotype_generation_2.R \
--bfile /home/eup009/cse284/1000_test \
--n_phenotypes 100 \
--n_negative_causal_variants 100 \
--n_positive_causal_variants 100 \
--negative_beta_min -1 \
--negative_beta_max -0.5 \
--positive_beta_min 1 \
--positive_beta_max 2 \
--out /home/eup009/cse284/CSE284_phenotype_2/1k_samples/1k_samples

Rscript /home/eup009/cse284/LinearRegression/phenotype_generation_2.R \
--bfile /home/eup009/cse284/10000_test \
--n_phenotypes 100 \
--n_negative_causal_variants 100 \
--n_positive_causal_variants 100 \
--negative_beta_min -1 \
--negative_beta_max -0.5 \
--positive_beta_min 1 \
--positive_beta_max 2 \
--out /home/eup009/cse284/CSE284_phenotype_2/10k_samples/10k_samples

