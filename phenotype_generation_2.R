# Null Phenotype generation
library(data.table, quietly = TRUE)
library(argparser, quietly = TRUE)
library(seqminer, quietly = TRUE)


p <- arg_parser('Generate a null phenotype')
p <- add_argument(p, '--bfile', help = 'plink file prefix')
p <- add_argument(p, '--n_phenotypes', help = 'number of phenotypes to generate')
p <- add_argument(p, '--n_negative_causal_variants', help = 'number of causal variants to generate')
p <- add_argument(p, '--n_positive_causal_variants', help = 'number of causal variants to generate')
p <- add_argument(p, '--negative_beta_min', help = 'range of beta values')
p <- add_argument(p, '--negative_beta_max', help = 'range of beta values')
p <- add_argument(p, '--positive_beta_min', help = 'range of beta values')
p <- add_argument(p, '--positive_beta_max', help = 'range of beta values')
p <- add_argument(p, '--out', help = 'output file prefix')

args <- parse_args(p)
args$n_phenotypes = as.numeric(args$n_phenotypes)
args$n_negative_causal_variants = as.numeric(args$n_negative_causal_variants)
args$n_positive_causal_variants = as.numeric(args$n_positive_causal_variants)
args$negative_beta_min = as.numeric(args$negative_beta_min)
args$negative_beta_max = as.numeric(args$negative_beta_max)
args$positive_beta_min = as.numeric(args$positive_beta_min)
args$positive_beta_max = as.numeric(args$positive_beta_max)

#test
# args = NULL
# args$bfile = '/home/eup009/cse284/CSE_284_Sim/simulate.100'
# args$n_phenotypes = 100
args$n_negative_causal_variants = 100
args$n_positive_causal_variants = 100
args$negative_beta_min = -1
args$negative_beta_max = -0.5
args$positive_beta_min = 0.5
# args$positive_beta_max = 1
# args$out = '/home/eup009/cse284/CSE284_phenotype_2/100_samples/100_samples'




# Read in the genotype file
plinkObj = openPlink(args$bfile)
sampleIndex = 1:length(plinkObj$fam$V1)
markerIndex = 1:length(plinkObj$bim$V2)
geno = readPlinkToMatrixByIndex(args$bfile, sampleIndex, markerIndex)
geno = 2 - geno


for (i in 1: args$n_phenotypes) {
    set.seed(i)

    # randomly select the negative causal variants without overlap
    negative_causal_variants = sample(markerIndex, args$n_negative_causal_variants)
    positive_causal_variants = sample(setdiff(markerIndex, negative_causal_variants), args$n_positive_causal_variants)

    negative_vec = runif(args$n_negative_causal_variants, min = args$negative_beta_min, max = args$negative_beta_max)
    positive_vec = runif(args$n_positive_causal_variants, min = args$positive_beta_min, max = args$positive_beta_max)



    Y = geno[, negative_causal_variants] %*% matrix(rep(negative_vec, args$n_negative_causal_variants), nrow = args$n_negative_causal_variants , byrow = TRUE) + 
            geno[, positive_causal_variants] %*% matrix(rep(positive_vec, args$n_positive_causal_variants), nrow = args$n_positive_causal_variants , byrow = TRUE) +
            rnorm(nrow(geno), sd = 5)

    pheno = data.table(IID = plinkObj$fam$V1, Y = Y)
    colnames(pheno) = c('IID', 'Y')
    write.table(pheno, file = paste0(args$out, '_set_', i,  '.pheno'), quote = FALSE, row.names = FALSE, col.names = TRUE)
}
