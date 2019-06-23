#!/bin/bash

###
# Works for cairosvg version =< 2.3.1
# Didn't worked for cairosvg version = 2.4.0
###

#scale=20
scale=5

file=$1

shopt -s nullglob

png=${file%.*}.png

if [[ ! -e $file ]] ; then
	echo "Error file does not exist!!: $file"
	exit 1
fi

if [[ $file  = *.svg ]] ; then
	echo cairosvg  -s $scale $file -o $png
	cairosvg  -s $scale $file -o $png
	echo mogrify -trim $png 
	mogrify -trim $png 
fi

if [[ $file  = *.png ]] ; then
	echo mogrify -trim $png 
	mogrify -trim $png 
fi

shopt -u nullglob

