library(qqman)
library(data.table)

args <- commandArgs(trailingOnly=TRUE)
if (length(args)!=2) {                                                                                    stop("Script requires 2 arguments (inputdir outdir)")                                      }      


for (s in c('100', '1k', '10k')){

	#type1
	res = c()
	for (i in 1:100){
    		tmp = fread(paste0(args[1], '/', s, '/LM_res_seed', i, '.lr'))
   		res <- c(res, tmp$P)
	}
	FP = length(which(res < (0.05 / length(res))))
	png(file = paste0(args[2], '/qqplot_100_samples_LR.png'))
    	qq(res, main = paste("QQ plot of p-values 100 samples \n False Positive:", FP))
	dev.off()
}
