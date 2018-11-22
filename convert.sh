#!/bin/bash

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

