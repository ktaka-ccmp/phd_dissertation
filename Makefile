
#TEX=main.tex draft.tex
TEX=main.tex draft.tex draft2.tex
PDF=$(TEX:.tex=.pdf)
BCF=$(TEX:.tex=.bcf)

.SUFFIXES: .pdf .tex .bcf

all:$(PDF)

%.bcf: %.tex Manuscript/*.tex Bib/*.bib Makefile *.cls Figs/*.png
	pdflatex $<

%.pdf: %.tex %.bcf Manuscript/*.tex Bib/*.bib Makefile *.cls Figs/*.png
	biber $(word 2,$^)
	pdflatex $<
	pdflatex $<

clean:
	$(RM)  $(PDF) *.aux *.log *~ *.bbl *.blg *.lof *.lot *.toc *.out *.ttt *.xwm *.fff Manuscript/*.aux Manuscript/*~ *.bcf *.loc *.run.xml *.soc *.tdo

