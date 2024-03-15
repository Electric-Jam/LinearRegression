library(qqman)
library(data.table)

#type1
res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output/100/LM_res_seed', i, '.lr'))
    res <- c(res, tmp$P)
}
FP = length(which(res < (0.05 / length(res))))
png(file = '/home/eup009/cse284/plots/qqplot_100_samples_LR.png')
    qq(res, main = paste("QQ plot of p-values 100 samples \n False Positive:", FP))
dev.off()


res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output/1k/LM_res_seed', i, '.lr'))
    res <- c(res, tmp$P)
}
FP = length(which(res < (0.05 / length(res))))
png(file = '/home/eup009/cse284/plots/qqplot_1k_samples_LR.png')
    qq(res, main = paste("QQ plot of p-values 1k samples \n False Positive:", FP))
dev.off()



res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output/10k/LM_res_seed', i, '.lr'))
    res <- c(res, tmp$P)
}
FP = length(which(res < (0.05 / length(res))))
png(file = '/home/eup009/cse284/plots/qqplot_10k_samples_LR.png')
    qq(res, main = paste("QQ plot of p-values 10k samples \n False Positive:", FP))
dev.off()

