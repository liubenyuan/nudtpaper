del *.aux *.log *.toc *.ind *.inx *.gls *.glo *.idx *.ilg *.out *.bak *.bbl *.brf *.blg *.dvi 
xelatex nudtpaper.ins
xelatex nudtpaper.dtx
makeindex -s gind nudtpaper
makeindex -s gglo -o nudtpaper.gls nudtpaper.glo
xelatex nudtpaper.dtx
xelatex nudtpaper.dtx
