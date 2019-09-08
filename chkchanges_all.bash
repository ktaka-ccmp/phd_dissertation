#!/bin/bash

FROM=Manuscript_changes
TO=Manuscript_stripped
FILES=$(egrep input  ${FROM}/body.tex |sed -e 's/}/\.tex/g'|cut -f 2 -d "/")

cp ${FROM}/body.tex ${TO}/body.tex

for file in ${FILES} abstract.tex acknowledgment.tex appendix.tex ; do

    echo
    echo
    echo
    echo showing diff for  $file
    diff ${FROM}/$file ${TO}/$file
    echo
    echo
    echo
    
done

