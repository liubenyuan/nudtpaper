del *.aux *.lo? *.toc *.ind *.inx *.gls *.glo *.idx *.ilg *.out *.bak *.bbl *.brf *.blg *.dvi data\*.aux
xelatex thesis
rem makeindex -s nomencl.ist -o thesis.nls thesis.nlo
biber thesis
xelatex thesis
xelatex thesis
