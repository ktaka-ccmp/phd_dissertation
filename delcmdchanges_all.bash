#!/bin/bash

FROM=Manuscript_changes
TO=Manuscript_stripped
FILES=$(egrep input  ${FROM}/body.tex |sed -e 's/}/\.tex/g'|cut -f 2 -d "/")

cp ${FROM}/body.tex ${TO}/body.tex

for file in ${FILES} abstract.tex acknowledgment.tex appendix.tex ; do 

    cp ${FROM}/$file before
    touch after
    echo converting $file
    ./delcmdchanges.bash before after
    while ! diff before after > /dev/null ; do
	cp after before
	echo converting $file
	./delcmdchanges.bash before after
    done

    mv after ${TO}/$file
    rm before

done

