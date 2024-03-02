if (!require(seqminer)) {
    install.packages("seqminer")
}
if (!require(data.table)) {
    install.packages("data.table")
}
if (!require(dplyr)) {
    install.packages("dplyr")
}
if (!require(ggplot2)) {
    install.packages("ggplot2")
}
if (!require(argparser)) {
    install.packages("argparser")
}

library(seqminer, quietly = TRUE)
library(data.table, quietly = TRUE)
library(dplyr, quietly = TRUE)
library(ggplot2, quietly = TRUE)
library(argparser, quietly = TRUE)

p <- arg_parser('Run Linear Regression on a plink bed file')
p <- add_argument(p, '--bfile', help = 'plink file prefix')
p <- add_argument(p, '--pheno', help = 'phenotype file')
p <- add_argument(p, '--covar', help = 'covariate file')
p <- add_argument(p, '--out', help = 'output file prefix')

args <- parse_args(p)
print(args)

# #test
# args = NULL
# args$bfile = '/home/parkej95/LinearRegression/ps2_admixture.pruned'
# args$pheno = '/home/parkej95/LinearRegression/test_pheno.pheno'
# args$covar = '/home/parkej95/LinearRegression/test_pheno.covar'


# Read in the genotype file
plinkObj = openPlink(args$bfile)
sampleIndex = 1:length(plinkObj$fam$V1)
markerIndex = 1:length(plinkObj$bim$V2)
geno = readPlinkToMatrixByIndex(args$bfile, sampleIndex, markerIndex)


# Read in the phenotype file
pheno = fread(args$pheno)

# Read in the covariate file
if (is.null(args$covar)) {
    pheno_covar = pheno
} else {
    covar = fread(args$covar)
    covar = covar[, -c('IID')]
    pheno_covar = cbind(pheno, covar)
}


# Run the linear regression.
# The output is a data frame with the following columns:
# SNP: the SNP name
# BETA: the beta coefficient
# SE: the standard error
# P: the p-value

pheno_covar = pheno_covar[, -c('IID')]
betas = c() ; ses = c() ; ps = c()
for(i in 1:ncol(geno)){
    if (i %% 1000 == 0) {
        cat('Analyzing SNP', i, '\n')
    }
    markerid = colnames(geno)[i]
    df = cbind(pheno_covar, geno[, i])
    colnames(df)[ncol(df)] = markerid

    model = lm(Y ~ ., data = df)

    # Extract the beta, se, and p-value
    beta = summary(model)$coefficients[paste0('`', markerid, '`'), 'Estimate']
    se = summary(model)$coefficients[paste0('`', markerid, '`'),  'Std. Error']
    p = summary(model)$coefficients[paste0('`', markerid, '`'), 'Pr(>|t|)']

    betas = c(betas, beta)
    ses = c(ses, se)
    ps = c(ps, p)
}

#create output file
output = data.frame(SNP = colnames(geno), BETA = betas, SE = ses, P = ps)
write.table(output, file = paste0(args$out, '.lr'), quote = FALSE, row.names = FALSE, col.names = TRUE)
