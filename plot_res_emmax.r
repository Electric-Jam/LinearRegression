library(qqman)
library(data.table)

res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output_emmax/100_emmax/LM_res_seed', i, '.ps'), header = FALSE)
    res <- c(res, tmp$V4)
}
FP = length(which(res < (0.05 / length(res))))
png(file = '/home/eup009/cse284/plots/qqplot_100_samples_emmax.png')
    qq(res, main = paste("QQ plot of p-values 100 samples \n False Positive:", FP))
dev.off()



res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output_emmax/1k_emmax/LM_res_seed', i, '.ps'), header = FALSE)
    res <- c(res, tmp$V4)
}
FP = length(which(res < (0.05 / length(res))))
png(file = '/home/eup009/cse284/plots/qqplot_1k_samples_emmax.png')
    qq(res, main = paste("QQ plot of p-values 1k samples \n False Positive:", FP))
dev.off()



res = c()
for (i in 1:100){
    tmp = fread(paste0('/home/eup009/cse284/output_emmax/10k_emmax/LM_res_seed', i, '.ps'), header = FALSE)
    res <- c(res, tmp$V4)
}
FP = length(which(res < (0.05 / length(res))))
png(file = '/home/eup009/cse284/plots/qqplot_10k_samples_emmax.png')
    qq(res, main = paste("QQ plot of p-values 10k samples \n False Positive:", FP))
dev.off()

