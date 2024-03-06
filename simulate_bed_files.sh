#!/bin/bash

basedir=$1

declare -a samplecounts=(100 1000 10000 50000)

tmp_params="$basedir/wgas.sim"

snpcount=10000
maflower=0.01
mafupper=0.5
implicatedsnps=100
qtlvar=0.0001
effecttype=0
oddsratiohet=1.00
oddsratiohom=1.00

for samplecount in "${samplecounts[@]}" ; do
    outdir="$basedir/simulate.${samplecount}"
    if [ ! -d "$outdir" ]; then
        mkdir $outdir
    fi
    echo "$snpcount qtl $maflower $mafupper $qtlvar $effecttype" > $tmp_params
    outpath="$outdir/simulate.${samplecount}"
    qtlcommand="plink --simulate-qt $tmp_params --simulate-n $samplecount --make-bed --out $outpath"
    $qtlcommand
    transposed=$outpath.transpose
    transposecommand="plink --bfile $outpath --recode12 --output-missing-genotype 0 --transpose --out $transposed"
    $transposecommand
done
