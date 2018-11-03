
draft: draft.pdf

all: paper.pdf draft.pdf

paper.pdf: main.tex Manuscript/*.tex Bib/*.bib Makefile #Figs/*.png
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex

draft.pdf: draft.tex Manuscript/*.tex Bib/*.bib Makefile *.cls #Figs/*.png
	pdflatex draft.tex
	bibtex draft
	pdflatex draft.tex
	pdflatex draft.tex
clean:
	$(RM)  *.aux *.pdf *.log *~ *.bbl *.blg *.lof *.lot *.toc *.out Manuscript/*.aux Manuscript/*~

