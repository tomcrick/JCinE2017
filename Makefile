targets = jcine2017.pdf

all: $(targets)

pdflatex = pdflatex -interaction=errorstopmode -halt-on-error

%.pdf: jcine2017_fixedrefs.tex jcine2017.bib
	$(pdflatex) $<
	bibtex $*
	$(pdflatex) $<
	$(pdflatex) $<

clean:
	rm -f $(targets) *.aux *.log *.nav *.out *.snm *.toc *.vrb *.bbl *.blg *.synctex.gz

winopen: 
	cmd start /c $(targets)
