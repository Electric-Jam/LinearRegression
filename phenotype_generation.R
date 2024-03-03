# Null Phenotype generation
library(data.table, quietly = TRUE)
library(argparser, quietly = TRUE)


p <- arg_parser('Generate a null phenotype')
p <- add_argument(p, '--fam', help = 'bim file')
p <- add_argument(p, '--n_phenotypes', help = 'number of phenotypes to generate')
p <- add_argument(p, '--out', help = 'output file prefix')

args <- parse_args(p)

#test
# args = NULL
# args$fam = '/home/parkej95/LinearRegression/ps2_admixture.pruned.fam'
# args$out = '/home/parkej95/LinearRegression/test_pheno'

# Generate a null phenotype

fam = fread(args$fam)
n = nrow(fam)

for (i in 1: args$n_phenotypes) {
    set.seed(as.integer(Sys.time()))

    pheno = data.table(IID = fam$V1, Y = rnorm(n))

    # Write the phenotype to a file
    write.table(pheno, file = paste0(args$out, '_set_', i,  '.pheno'), quote = FALSE, row.names = FALSE, col.names = TRUE)

}
###temp covar generation
covar = data.table(IID = fam$V1, PC1 = rnorm(n), PC2 = rnorm(n))
write.table(covar, file = paste0(args$out, '.covar'), quote = FALSE, row.names = FALSE, col.names = TRUE)
