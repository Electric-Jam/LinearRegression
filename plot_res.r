library(qqman)
library(data.table)
res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output/100/LM_res_seed', i, '.lr'))
    res <- c(res, tmp$P)
}

png(file = '/home/eup009/cse284/plots/qqplot_100_samples.png')
    qq(res, main = "QQ plot of p-values 100 samples")
dev.off()


res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output/1k/LM_res_seed', i, '.lr'))
    res <- c(res, tmp$P)
}

png(file = '/home/eup009/cse284/plots/qqplot_1k_samples.png')
    qq(res, main = "QQ plot of p-values 1k samples")
dev.off()



res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output/10k/LM_res_seed', i, '.lr'))
    res <- c(res, tmp$P)
}

png(file = '/home/eup009/cse284/plots/qqplot_10k_samples.png')
    qq(res, main = "QQ plot of p-values 10k samples")
dev.off()