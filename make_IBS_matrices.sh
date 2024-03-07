#!/bin/sh

declare -a samplesizes=(100 1000 10000)

basedir=$1
emmax_kin_path=$3
outbase=$2

for samplesize in "${samplesizes[@]}" ; do
	outdir="$outbase/simulate.${samplesize}"
	if [ ! -d "$outdir" ]; then
		mkdir $outdir
	fi
	tped_prefix=$outdir/simulate.$samplesize.transpose
	outpath=$outdir/simulate.$samplesize.kinf
	command="$emmax_kin_path -v -s -d 10 $tped_prefix"
	$command
done

