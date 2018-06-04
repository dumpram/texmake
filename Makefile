TEX = $(wildcard *.tex)
PDF = $(patsubst %.tex, %.pdf, $(TEX))
AUX = $(patsubst %.tex, %.aux, $(TEX))


%.pdf : %.tex
	pdflatex $<
	bibtex $(basename $< .aux)
	pdflatex $<
	pdflatex $<

all : $(PDF)

clean :
	rm -f *.bbl *.blg *.aux *.pdf *.log *.lot *.lof *.toc *.glo *.gls *.glg *.ist *.out

