#!/bin/sh

declare -a samplesizes=(100 1000 10000)

basedir=$1
emmax_kin_path=$4
emmax_path=$5
outbase=$3
phenobase=$2

for samplesize in "${samplesizes[@]}" ; do
	outdir="$outbase/simulate.${samplesize}"
	if [ ! -d "$outdir" ]; then
		mkdir $outdir
	fi
	phenopath=$phenobase/${samplesize}_samples
	tped_prefix=$outdir/simulate.$samplesize.transpose 
	kin_mat=$outdir/simulate.${samplesize}.transpose.aIBS.kinf 
	assoc_path=$outdir/outputs
	if [ ! -d "$assoc_path" ]; then
		mkdir $assoc_path
	fi
	for pheno in $phenopath/*_samples_set_* ; do
	       	pheno=$phenopath/*_samples_set_$rep.pheno
		basepheno="$(basename $pheno | cut -d "_" -f 4 | cut -d "." -f 1)"
		gwas_path=$assoc_path/$basepheno.gwas
		command="$emmax_path -d 10 -t $tped_prefix -p $pheno -k $kin_mat -o $gwas_path"
		$command
	done	
done

