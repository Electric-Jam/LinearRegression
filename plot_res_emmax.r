library(qqman)
library(data.table)
res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/danielhalmos/CSE_284_Results/simulate.100/outputs/', i, '.gwas.ps'), header = FALSE)
    res <- c(res, tmp$V4)
}

png(file = '/home/danielhalmos/CSE_284_Results/simulate.100/qqplot_emmax_100_samples.png')
    qq(res, main = "QQ plot of p-values 100 samples")
dev.off()



res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/danielhalmos/CSE_284_Results/simulate.1000/outputs/', i, '.gwas.ps'), header = FALSE)
    res <- c(res, tmp$V4)
}

png(file = '/home/danielhalmos/CSE_284_Results/simulate.1000/qqplot_emmax_1000_samples.png')
    qq(res, main = "QQ plot of p-values 1k samples")
dev.off()



res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/danielhalmos/CSE_284_Results/simulate.10000/outputs/', i, '.gwas.ps'), header = FALSE)
    res <- c(res, tmp$V4)
}

png(file = '/home/danielhalmos/CSE_284_Results/simulate.10000/qqplot_emmax_10000_samples.png')
    qq(res, main = "QQ plot of p-values 10k samples")
dev.off()

