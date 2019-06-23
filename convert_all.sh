#!/bin/bash

###
# Works for cairosvg version =< 2.3.1
# Didn't worked for cairosvg version = 2.4.0
###

#scale=20
scale=5

DIR=./Figs
shopt -s nullglob

for f in $DIR/*.svg ; do
echo cairosvg  -s $scale $f -o ${f%.*}.png
cairosvg  -s $scale $f -o ${f%.*}.png
done

for f in $DIR/*.png ; do
echo mogrify -trim $f 
mogrify -trim $f 
done

shopt -u nullglob

