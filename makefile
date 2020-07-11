pdfbiber: thesis.tex data/*.tex
	xelatex thesis
	biber thesis
	xelatex thesis
	xelatex thesis

pdfbibtex: thesis.tex data/*.tex
	xelatex thesis
	bibtex thesis
	bibtex thesis
	xelatex thesis
	xelatex thesis

# cls: nudtpaper.dtx nudtpaper.ins
# 	xelatex nudtpaper.ins
# 	xelatex nudtpaper.dtx
# 	makeindex -s gind nudtpaper
# 	makeindex -s gglo -o nudtpaper.gls nudtpaper.glo
# 	xelatex nudtpaper.dtx
# 	xelatex nudtpaper.dtx

clean:
	rm -fv *.aux *.log *.toc *.ind *.gls *.glo *.idx *.ilg *.out *.bbl *.thm *.blg *.lot *.lof *.pdf *.nls *.nlo *.bcf *.xml
