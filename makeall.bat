del *.aux *.log *.toc *.ind *.inx *.gls *.glo *.idx *.ilg *.out *.bak *.bbl *.brf *.blg *.dvi 
xelatex nudtpaper.ins
xelatex thesis.tex
rem makeindex -s gind thesis
rem makeindex -s gglo -o thesis.gls thesis.glo
biber thesis
xelatex thesis.tex
xelatex thesis.tex
