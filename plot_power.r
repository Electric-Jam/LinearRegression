library(data.table)

args = commandArgs(trailingOnly=TRUE)

if (length(args)<2) {
       stop("Script requires 2 arguments (inputdir outdir)")
}

sample = c(100, 1000, 10000)
power_LR = c()
power_LMM = c()

#load LR result

# for (s in c('100', '1k')){
for (s in c('100', '1k', '10k')){

    res_LR = c()
    res_LMM = c()
    for (i in 1:100){
        tmp_LR = fread(paste0(args[1], s, '_type2/LM_res_seed', i, '.lr'))
        res_LR <- c(res_LR, tmp_LR$P)

        tmp_LMM = fread(paste0(args[1], s, '_emmax_type2/LM_res_seed', i, '.ps'))
        res_LMM <- c(res_LMM, tmp_LMM$V4)
    }

    power_LR = c(power_LR, length(which(res_LR < (0.05 / length(res_LR)))) / 200 / i)
    power_LMM = c(power_LMM, length(which(res_LMM < (0.05 / length(res_LMM)))) / 200 / i)

    # power_LR = c(power_LR, length(which(res_LR < 5*10**(-8))) / 200 / i)
    # power_LMM = c(power_LMM, length(which(res_LMM < 5*10**(-8))) / 200 / i)

}
