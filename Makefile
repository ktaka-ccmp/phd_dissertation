
paper.pdf: main.tex Manuscript/*.tex Bib/*.bib Makefile #Figs/*.png
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex

clean:
	$(RM)  *.aux *.pdf *.log *~ *.bbl *.blg *.lof *.lot *.toc *.out Manuscript/*.aux Manuscript/*~

