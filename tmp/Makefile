
TEX=aaa.tex bbb.tex
PDF=$(TEX:.tex=.pdf)
BCF=$(TEX:.tex=.bcf)

.SUFFIXES: .pdf .tex .bcf

all: $(PDF)
#all: aaa.pdf bbb.pdf

%.bcf: %.tex
	echo pdflatex $<
	touch $@
	@echo

%.pdf: %.tex %.bcf
	echo pdflatex $<
	echo biber main $(word 2,$^)
	touch $@
	@echo

clean:
	rm *.pdf


