#!/bin/sh

declare -a samplesizes=(100 1000 10000)

basedir=$1
phenobase=$2
outbase=$3
emmax_kin_path=$4
emmax_path=$5

for samplesize in "${samplesizes[@]}" ; do
	outdir="$outbase/output_emmax/${samplesize}_emmax"
	if [ ! -d "$outdir" ]; then
		mkdir -p $outdir
	fi
	phenopath=$phenobase/${samplesize}_samples
	tped_prefix=$basedir/simulate.$samplesize/simulate.$samplesize.transpose
	kin_mat=$basedir/simulate.$samplesize/simulate.${samplesize}.transpose.aIBS.kinf 
	for pheno in $phenopath/*_samples_set_* ; do
		basepheno="$(basename $pheno | cut -d "_" -f 4 | cut -d "." -f 1)"
		gwas_path=$outdir/LM_res_seed$basepheno
		command="$emmax_path -d 10 -t $tped_prefix -p $pheno -k $kin_mat -o $gwas_path"
		$command
	done	
done

