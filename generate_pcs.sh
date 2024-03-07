#!/bin/bash

basedir=$1

declare -a samplecounts=(100 1000 10000)

pcs=4
for samplecount in "${samplecounts[@]}" ; do
    indir="$basedir/simulate.${samplecount}"
    infileprefix="$indir/simulate.${samplecount}"
    command="plink --pca $pcs --bed $infileprefix.bed --bim $infileprefix.bim --fam $infileprefix.fam --out $infileprefix"
    $command
done
