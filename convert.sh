#!/bin/bash

DIR=./Figs
shopt -s nullglob

for f in $DIR/*.svg ; do
echo cairosvg  -s 20 $f -o ${f%.*}.png
cairosvg  -s 10 $f -o ${f%.*}.png
done

for f in $DIR/*.png ; do
echo mogrify -trim $f 
mogrify -trim $f 
done

shopt -u nullglob

