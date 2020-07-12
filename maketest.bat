call makeclear.bat

chcp 65001

if exist "thesis.tex" (
	copy thesis.tex thesis.texbak /Y
	echo PLEASE NOTE: thesis.tex is backuped with file thesis.texbak!!!!
	pause
) else (
    echo thesis.tex is not exist!
)

del /Q thesis.pdf thesis-bibtex.pdf

xelatex nudtpaper.ins

for /f "delims=:" %%m in ('"findstr /n documentclass thesis.tex"') do echo %%m & set num=%%m 
echo num=%num%
echo.>tmp.txt

set /a k=0
for /f "tokens=1 delims=" %%j in ('"findstr .* thesis.tex"') do (
	set /a k+=1
	setlocal enabledelayedexpansion
	echo !k!
	if !k!==%num% ( 
		echo num=%num%
		echo.%%j
		echo.\documentclass[doctor,twoside,fz]{nudtpaper} >>tmp.txt
	) else ( 
		echo.%%j >>tmp.txt
	)
	endlocal
)

del /q thesis.tex
ren tmp.txt thesis.tex
call makeclear.bat
xelatex thesis.tex
bibtex thesis
xelatex thesis.tex
xelatex thesis.tex
copy thesis.pdf thesis-bibtex.pdf

call makeclear.bat
xelatex nudtpaper.ins
xelatex nudtpaper.dtx
makeindex -s gind nudtpaper
makeindex -s gglo -o nudtpaper.gls nudtpaper.glo
xelatex nudtpaper.dtx
xelatex nudtpaper.dtx


xelatex thesis.tex
biber thesis
xelatex thesis.tex
xelatex thesis.tex


goto endlabel

:endlabel
echo test finished!
	
