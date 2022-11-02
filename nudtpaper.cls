%%
%% This is file `nudtpaper.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% nudtpaper.dtx  (with options: `cls')
%%
%% This is a generated file.
%%
%% Copyright (C) 2020 by Liu Benyuan <liubenyuan@gmail.com>
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%
%% http://www.latex-project.org/lppl.txt
%%
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%%
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%%
%% Any Suggestions : LiuBenYuan <liubenyuan@gmail.com>
%% Thanks Xue Ruini <xueruini@gmail.com> for the thuthesis class!
%% Thanks sofoot for the original NUDT paper class!
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{nudtpaper}
[2020/07/01 v2.8 NUDT paper template]
\newif\ifismaster\ismastertrue
\DeclareOption{master}{\ismastertrue}
\DeclareOption{doctor}{\ismasterfalse}
\newif\ifisanon\isanonfalse
\DeclareOption{anon}{\isanontrue}
\newif\ifistwoside\istwosidefalse
\DeclareOption{twoside}{\istwosidetrue}
\newif\ifisprof\isproffalse
\DeclareOption{prof}{\isproftrue}
\DeclareOption*{\PackageWarning{nudtpaper}{Unknown Option '\CurrentOption'}}
\newif\ifisttf\isttffalse
\newif\ifisotf\isotffalse
\newif\ifisfz\isfzfalse
\newif\ifisfandol\isfandolfalse
\DeclareOption{ttf}{\isttftrue}
\DeclareOption{otf}{\isotftrue}
\DeclareOption{fz}{\isfztrue}
\DeclareOption{fandol}{\isfandoltrue}
%add biber option
%if biber is set, use biblatex to generate bibliography
\newif\ifisbiber\isbiberfalse
\DeclareOption{biber}{\isbibertrue}
%add resumebib option
%if resumebib is set, use biblatex to generate resume
\newif\ifisresumebib\isresumebibfalse
\DeclareOption{resumebib}{\isresumebibtrue}
\ProcessOptions\relax
\RequirePackage{ifthen,calc}
\ifistwoside
  \LoadClass[a4paper,12pt,openright,twoside]{book}
\else
  \LoadClass[a4paper,12pt,openany]{book}
\fi
\RequirePackage[includeheadfoot]{geometry}
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{slashbox}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb}
\RequirePackage[Symbolsmallscale]{upgreek}
\interdisplaylinepenalty=2500
\RequirePackage{bm}
\RequirePackage[T1]{fontenc}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage[CJKchecksingle,no-math]{xeCJK}
\RequirePackage{zhnumber}
\RequirePackage{indentfirst}
\RequirePackage{xunicode-addon}
\RequirePackage{notoccite}
\newcommand{\fttilde}{\fontspec{FreeSerif}\selectfont}
\ifisbiber
\RequirePackage[backend=biber,style=gb7714-2015,gbalign=gb7714-2015,%
gbnamefmt=lowercase,gbpub=false]{biblatex}%
\setlength{\bibitemsep}{1pt}
\setlength{\bibnamesep}{0ex}
\setlength{\bibinitsep}{0ex}
\setlength{\biblabelsep}{6pt}
\newlength{\refindent}
\setlength{\refindent}{24pt}
\renewcommand{\itemcmd}{%
\setlength{\lengthid}{0cm}%
\setlength{\lengthlw}{\textwidth}%
\addtolength{\lengthlw}{-\lengthid}%
\addvspace{\bibitemsep}%恢复\bibitemsep的作用 %\parshape 2 0em \textwidth \lengthid \lengthlw
\hangindent\lengthid%
\hspace{\refindent}\mkgbnumlabel{\printfield{labelnumber}}%
\hspace{\biblabelsep}}
\DefineBibliographyExtras{english}{\renewcommand*{\bibrangedash}{{\fttilde\textsim}}}%将页码间隔符替换会英文的短横线
%比如：～$\sim$\symbol{"FF5E}\symbol{"223C}\symbol{"2053}\symbol{"02DC}\symbol{"02F7}
%\textsim \textbacksim \texttildebelow \texttildelow \texttilde
\defbibheading{subbibliography}[\bibname]{%
\section*{#1}}
\DeclareDelimFormat{streditortypes}{\bibopenparen%
  \edef\userfieldabcde{userd}%
  \ifcurrentname{editor}{\edef\userfieldabcde{userc}}{}%
  \ifcurrentname{bookauthor}{\edef\userfieldabcde{userb}}{}%
  \ifcase\value{gbbiblocalcase}%
    \iffieldequalstr{\userfieldabcde}{chinese}{\bibstring{\thefield{editortype}scn}}{}%
    \iffieldequalstr{\userfieldabcde}{korean}{\bibstring{\thefield{editortype}skr}}{}%
    \iffieldequalstr{\userfieldabcde}{japanese}{\bibstring{\thefield{editortype}sjp}}{}%
    \iffieldequalstr{\userfieldabcde}{english}{\bibstring{\thefield{editortype}s}}{}%
    \iffieldequalstr{\userfieldabcde}{french}{\bibstring{\thefield{editortype}s}}{}%
    \iffieldequalstr{\userfieldabcde}{russian}{\bibstring{\thefield{editortype}s}}{}%
  \or%
  \bibstring{\thefield{editortype}scn}%
  \or%
  \bibstring{\thefield{editortype}s}%
  \fi\bibcloseparen}
\DeclareDelimFormat{streditortype}{\bibopenparen%
  \edef\userfieldabcde{userd}%
  \ifcurrentname{editor}{\edef\userfieldabcde{userc}}{}%
  \ifcurrentname{bookauthor}{\edef\userfieldabcde{userb}}{}%
  \ifcase\value{gbbiblocalcase}%
    \iffieldequalstr{\userfieldabcde}{chinese}{\bibstring{\thefield{editortype}cn}}{}%
    \iffieldequalstr{\userfieldabcde}{korean}{\bibstring{\thefield{editortype}kr}}{}%
    \iffieldequalstr{\userfieldabcde}{japanese}{\bibstring{\thefield{editortype}jp}}{}%
    \iffieldequalstr{\userfieldabcde}{english}{\bibstring{\thefield{editortype}}}{}%
    \iffieldequalstr{\userfieldabcde}{french}{\bibstring{\thefield{editortype}}}{}%
    \iffieldequalstr{\userfieldabcde}{russian}{\bibstring{\thefield{editortype}}}{}%
  \or%
  \bibstring{\thefield{editortype}cn}%
  \or%
  \bibstring{\thefield{editortype}}%
  \fi\bibcloseparen}
\renewbibmacro*{in:}{%
 \iftoggle{bbx:gbpunctin}{\printtext{\textbf{//}\allowbreak}}%\addthinspace
                         {\setunit{\adddot\addspace}%
                         \iffieldequalstr{userd}{chinese}%
                         {\printtext{\bibstring{incn}}}%
                         {\printtext{\bibstring{in}}}%
                         }}%\newunit\newblock\intitlepunct
\ifisresumebib
\defbibenvironment{resumebib}%修改对齐环境-调整缩进
  {\list
     {\printtext[labelnumberwidth]{%
        \printfield{labelprefix}%
        \printfield{labelnumber}}}
{\setlength{\labelwidth}{\labelnumberwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \setlength{\leftmargin}{\bibhang}%
      \addtolength{\leftmargin}{\labelnumberwidth}%
      \setlength{\itemindent}{\bibitemindent}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}%
      \renewcommand*{\makelabel}[1]{\hss##1}}
  {\endlist}
  {\item}
\fi
\else
\RequirePackage[numbers,sort&compress,square]{natbib}
\let\newcite=\cite
\let\parencite=\newcite
\let\inlinecite=\newcite
\newcommand{\upcite}[1]{\textsuperscript{\newcite{#1}}} % 上标形式引用
\renewcommand{\cite}[1]{\textsuperscript{\newcite{#1}}} % 上标形式引用
\fi
\RequirePackage[colorlinks=true,linkcolor=blue,citecolor=red,pdfborder=0 1 1]{hyperref}
\RequirePackage{datetime}
\defaultfontfeatures{Mapping=tex-text}
\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1}

\newcommand{\installttf}{
    %%%% Windows Thesis Fonts
    \setmainfont{Times New Roman PS Std}
    \setsansfont{Arial}
    \setmonofont{Courier New}
    %%%% Using Office Family Fonts
    \setCJKmainfont[BoldFont={STZhongsong}]{SimSun}
    \setCJKsansfont{SimHei} % Hei
    \setCJKmonofont{FangSong} % Fangsong
    %%%% alias
    \setCJKfamilyfont{song}{SimSun}
    \setCJKfamilyfont{hei}{SimHei}
    \setCJKfamilyfont{fs}{FangSong} % fang-song
    \setCJKfamilyfont{kai}{KaiTi} % Kai
}

\newcommand{\installotf}{
    %%%% Windows Thesis Fonts
    \setmainfont{Times New Roman PS Std}
    \setsansfont{Arial}
    \setmonofont{Courier New}
    %%%% Using Adobe Family Fonts
    \setCJKmainfont[BoldFont={STZhongsong}]{Adobe Song Std}
    \setCJKsansfont{Adobe Heiti Std} % Hei
    \setCJKmonofont{Adobe Fangsong Std} % Fangsong
    %%%% alias
    \setCJKfamilyfont{song}{Adobe Song Std}
    \setCJKfamilyfont{hei}{Adobe Heiti Std}
    \setCJKfamilyfont{fs}{Adobe Fangsong Std} % fang-song
    \setCJKfamilyfont{kai}{Adobe Kaiti Std} % Kai
}

\newcommand{\installfz}{
    %%%% Windows Thesis Fonts
    \setmainfont{Times New Roman PS Std}
    \setsansfont{Arial}
    \setmonofont{Courier New}
    %%%% Using Founder Family Fonts
    \setCJKmainfont[BoldFont={FZYaSong-DB-GBK}]{FZShuSong_GB18030-Z01}
    \setCJKsansfont{FZHei-B01} % Hei
    \setCJKmonofont{FZFangSong-Z02} % fs
    %%%% alias
    \setCJKfamilyfont{song}{FZShuSong_GB18030-Z01}
    \setCJKfamilyfont{hei}{FZHei-B01}
    \setCJKfamilyfont{fs}{FZFangSong-Z02} % fang-song
    \setCJKfamilyfont{kai}{FZKai-Z03} % Kai
}

\newcommand{\installfandol}{
    %%%% Windows Thesis Fonts
    \setmainfont{Times New Roman PS Std}
    \setsansfont{Arial}
    \setmonofont{Courier New}
    %%%% Using Fandol Family Fonts
    \setCJKmainfont{FandolSong}
    \setCJKsansfont{FandolHei} % Hei
    \setCJKmonofont{FandolFang} % fs
    %%%% alias
    \setCJKfamilyfont{song}{FandolSong}
    \setCJKfamilyfont{hei}{FandolHei}
    \setCJKfamilyfont{fs}{FandolFang} % fang-song
    \setCJKfamilyfont{kai}{FandolKai} % Kai
}

\ifisttf
\installttf
\fi

\ifisotf
\installotf
\fi

\ifisfz
\installfz
\fi

\ifisfandol
\installfandol
\fi

\newcommand{\cusong}{\bfseries}
\newcommand{\song}{\CJKfamily{song}}     % 宋体
\newcommand{\fs}{\CJKfamily{fs}}         % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}       % 楷体
\newcommand{\hei}{\CJKfamily{hei}}       % 黑体
\def\songti{\song}
\def\fangsong{\fs}
\def\kaishu{\kai}
\def\heiti{\hei}
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
    \setlength{\thu@linespace}{#2*\real{#1}}%
    \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
    \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\newcommand{\china}{中华人民共和国}
\def\nudtpaper{\textsc{Nudt}\textsc{Paper}}
\newcommand{\pozhehao}{\kern0.2em\rule[0.8ex]{1.6em}{0.1ex}\kern0.2em}
\newcommand{\xiaopozhe}{\kern0.2em\rule[0.8ex]{0.6em}{0.1ex}\kern0.2em}
\renewcommand\contentsname{目\hspace{1em}录}
\renewcommand\listfigurename{图\hspace{1em}目\hspace{1em}录}
\renewcommand\listtablename{表\hspace{1em}目\hspace{1em}录}
\newcommand\listequationname{公式索引}
\newcommand\equationname{公式}
\renewcommand\bibname{参考文献}
\renewcommand\indexname{索引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\def\CJK@today{\zhdigits{\the\year}年\zhnumber{\the\month}月}
\renewcommand\zhtoday{\CJK@today}
\newcommand\entoday{\monthname{}, \the\year}
\geometry{top=21mm,bottom=25.5mm,left=30mm,right=30mm}
\geometry{headheight=9mm,headsep=1mm,footskip=9mm}
\renewcommand\setheadrule[1]{%
  \ifdim#1=\z@
    \let\makeheadrule\@empty
  \else
    \def\makeheadrule{%
    \makebox[0pt][l]{\rule[.2\baselineskip]{\linewidth}{1.5pt}}%
    \rule{\linewidth}{1.5pt}}%
  \fi}
\renewpagestyle{plain}{
\sethead{}{\raisebox{.65\baselineskip}{\songti \wuhao \ifisanon{~}\else{国防科技大学研究生院{\ifisprof{专业学位}\else{}\fi}\@optionpaperclass{}学位论文}\fi}}{}%
\setfoot{}{{\songti \wuhao 第~\thepage~页}}{}%
\headrule%
\footrule%
}
\setfootrule{1bp}
\renewcommand\frontmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{plain}}
\newcommand\midmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{roman}
    \pagestyle{plain}}
\renewcommand\mainmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{plain}}
\renewcommand\backmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \titleformat{\chapter}{\filcenter \heiti \sanhao}{附录\,\thechapter\,}{1em}{}
    \titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \heiti \xiaosi[1.25]}
      {附录\,\thecontentslabel\quad}{}
      {\hspace{.5em}\titlerule*{.}\contentspage}
    \@mainmattertrue
    \pagestyle{plain}}
\renewcommand\cleardoublepage{\clearpage\if@openright \ifodd\c@page\else
  \newpage{}
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
  \end{center}
  \vspace*{\fill}
  \clearpage\fi\fi%
}
\titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \heiti \xiaosi[1.25]}
    {第\zhnumber{\thecontentslabel}章\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2em]{\songti \xiaosi[1.25]}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4em]{\songti \xiaosi[1.25]}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{figure}[0pt]{\songti \xiaosi[1.25]}
    {\makebox[3.5em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[0pt]{\songti \xiaosi[1.25]}
    {\makebox[3.5em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\nudt@chapter\@schapter}
\def\nudt@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \if@mainmatter
      \refstepcounter{chapter}%
      \addcontentsline{toc}{chapter}%
        {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi
}
\newcommand\cabstractname{摘\hspace{1em}要}
\newcommand\eabstractname{ABSTRACT}
\newcommand\ckeywordsname{关键词}
\newcommand\ckeywords[1]{{\hei\xiaosi \ckeywordsname：#1}}
\newcommand\ekeywordsname{Key Words}
\newcommand\ekeywords[1]{\textsf{\xiaosi \ekeywordsname：#1}}
\newenvironment{cabstract}{%
    \chapter{\cabstractname}
    \xiaosi
    \@afterheading}
    {\par\vspace{2em}\par}
\newenvironment{eabstract}{%
    \chapter{\textsf{\eabstractname}}
    \xiaosi
    \@afterheading}
    {\par\vspace{2em}\par}
\newcommand{\sectionbreak}{%
\addpenalty{-300}%
\vspace*{0pt}%
}
\setlength{\topskip}{0pt}
\setcounter{secnumdepth}{3}
\setlength{\footnotesep}{2.2ex \@minus 2bp}
\titleformat{\chapter}{\filcenter\sf \heiti\sanhao[1.25]}{第\zhnumber{\thechapter}章\,}{1em}{}
\titleformat{\section}{\filcenter\bfseries \cusong\sihao[1.25]}{\thesection}{1em}{}
\titleformat{\subsection}{\sf \heiti\xiaosi[1.25]}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries \cusong\xiaosi[1.25]}{\thesubsubsection}{1em}{}
\titlespacing{\chapter}{0pt}{2.4ex-\topskip-\heightof{A}}{2.4ex \@minus 2bp}
\titlespacing{\section}{0pt}{2ex-\heightof{a}}{2ex \@minus 2bp}
\titlespacing{\subsection}{2em}{2ex \@minus 2bp}{2ex \@minus 2bp}
\titlespacing{\subsubsection}{2em}{1ex \@minus 2bp}{1ex \@minus 2bp}
\renewcommand\normalsize{%
\@setfontsize\normalsize{12bp}{12.87bp}%
\renewcommand{\baselinestretch}{1.3}%
\setlength\abovedisplayskip{10bp \@minus 1bp}%
\setlength\abovedisplayshortskip{10bp \@minus 1bp}%
\setlength\belowdisplayskip{\abovedisplayskip}%
\setlength\belowdisplayshortskip{\abovedisplayshortskip}%
}
\newlength\CJK@twochars
\def\CJKindent{%
  \settowidth\CJK@twochars{中国}%
  \parindent\CJK@twochars}
\AtBeginDocument{%
  \CJKindent\relax
  \checkparameter\relax
}
\setlength{\parskip}{0bp \@minus 1bp}
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
\newlength\biblabelwd
\settowidth\biblabelwd{\widthof{[999]}} % Maximum Ref Num = 999
\renewenvironment{thebibliography}[1]{%
  \chapter*{\bibname}%
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
  \begin{enumerate}[label={[\arabic{enumi}]},itemsep=0pt,parsep=0pt,labelindent=\CJK@twochars,labelwidth=\biblabelwd,leftmargin=0pt,itemindent=*,align=left]
  \@openbib@code%
  \sloppy\frenchspacing%
  \clubpenalty4000%
  \widowpenalty4000%
  \interlinepenalty4000%
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
     \end{enumerate}\frenchspacing}
\setlength{\floatsep}{12bp}
\setlength{\intextsep}{12bp}
\setlength{\textfloatsep}{12bp}
\setlength{\@fptop}{0bp}
\setlength{\@fpsep}{12bp}
\setlength{\@fpbot}{0bp}
\renewcommand{\textfraction}{0.01}
\renewcommand{\topfraction}{0.98}
\renewcommand{\bottomfraction}{0.98}
\renewcommand{\floatpagefraction}{0.90}
\clubpenalty=5000
\widowpenalty=5000
\displaywidowpenalty=5000
\let\old@tabular\@tabular
\def\thu@tabular{\wuhao[1.25]\old@tabular}
\DeclareCaptionLabelFormat{thu}{{\wuhao[1.25]\song#1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{thu}{\hspace{1em}}
\DeclareCaptionFont{thu}{\wuhao[1.25]}
\captionsetup{labelformat=thu,labelsep=thu,font=thu}
\captionsetup[table]{position=top,belowskip=0bp \@plus 2bp \@minus 2bp,aboveskip=6bp \@plus 2bp \@minus 2bp}%
\captionsetup[figure]{position=bottom,belowskip=-3bp \@plus 2bp \@minus 2bp,aboveskip=6bp \@plus 2bp \@minus 2bp}%
\captionsetup[subfloat]
{labelformat=simple,font=thu,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\thu@LT@array\LT@array
\def\LT@array{\thu@LT@array}
\newenvironment{denotation}[1][2.71828cm]{
    \noindent\vskip-4bp\begin{list}{}%
    {\vskip-30bp\xiaosi[1.5]
    \renewcommand\makelabel[1]{\textbf{##1}\hfil}
    \setlength{\labelwidth}{#1} % 标签盒子宽度
    \setlength{\labelsep}{0cm} % 标签与列表文本距离
    \setlength{\itemindent}{0em} % 标签缩进量
    \setlength{\leftmargin}{\labelwidth+\labelsep+2em} % 左边界
    \setlength{\rightmargin}{0cm}
    \setlength{\parsep}{0cm} % 段落间距
    \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0pt} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
}}{\end{list}}
\newenvironment{ack}{%
    \chapter*{致\hspace{1em}谢}%
    \addcontentsline{toc}{chapter}{致谢}%
    \ifisanon\color{white}\else\relax\fi%
    \xiaosi%
    \@afterheading}
    {\par\vspace{2em}\par}
\newenvironment{resume}{%
    \chapter*{作者在学期间取得的学术成果}
    \addcontentsline{toc}{chapter}{作者在学期间取得的学术成果}
    \xiaosi
    \@afterheading}
    {\par\vspace{2em}\par}
\renewtheoremstyle{nonumberplain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ \theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ (##3)\theorem@separator]}
\theoremstyle{nonumberplain}
\theorembodyfont{\kai\xiaosi[1.3]}
\theoremheaderfont{\hei\xiaosi[1.3]}
\theoremseparator{:\,}
\newtheorem{proof}{证明}[chapter]
\newtheorem{assumption}{假设}[chapter]

\renewtheoremstyle{plain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\ (##3)\theorem@separator]}
\theoremstyle{plain}
\theorembodyfont{\kai\xiaosi[1.3]}
\theoremheaderfont{\hei\xiaosi[1.3]}
\theoremsymbol{}
\newtheorem{definition}{定义}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{exercise}{练习}[section]
\newtheorem{example}{例}[chapter]
\newtheorem{problem}{问题}[section]
\newtheorem{remark}{注释}[section]
\def\classification#1{\def\@classification{#1}} % 中图分类号
\def\serialno#1{\def\@serialno{#1}} % 学号
\def\UDC#1{\def\@UDC{#1}} % UDC号
\def\confidentiality#1{\def\@confidentiality{#1}} % 密级
\def\title#1{\def\@title{#1}} % 中文题目
\newtoks\displaytitle
\def\author#1{\def\@author{#1}}
\def\zhdate#1{\def\@zhdate{#1}} % 中文日期
\def\subject#1{\def\@subject{#1}} % 中文学科
\def\researchfield#1{\def\@researchfield{#1}} % 中文研究方向
\def\supervisor#1{\def\@supervisor{#1}} % 导师
\def\cosupervisor#1{\def\@cosupervisor{#1}} % 协助指导教师
\def\papertype#1{\def\@papertype{#1}} % 工学，理学，同等学历申请工(理)学
\def\entitle#1{\def\@entitle{#1}}
\def\enauthor#1{\def\@enauthor{#1}}
\def\ensupervisor#1{\def\@ensupervisor{#1}}
\def\encosupervisor#1{\def\@encosupervisor{#1}}
\def\endate#1{\def\@endate{#1}}
\def\ensubject#1{\def\@ensubject{#1}}
\def\enpapertype#1{\def\@enpapertype{#1}} % Engineering, Science
\def\optionpaperclass#1{\def\@optionpaperclass{#1}} % paperclass
\def\optionpaperclassen#1{\def\@optionpaperclassen{#1}}
\def\optionas#1{\def\@optionas{#1}} % Supervisor
\ifismaster
  \optionpaperclass{硕士}
  \optionpaperclassen{Master}
  \optionas{Supervisor}
\else
  \optionpaperclass{博士}
  \optionpaperclassen{Ph.D}
  \optionas{Supervisor}
\fi
\newcommand{\checkparameter}
{
  \ifthenelse{\isundefined{\@cosupervisor}}{\cosupervisor{}}{}
  \ifthenelse{\isundefined{\@encosupervisor}}{\encosupervisor{}}{}
}
\def\maketitle{%
  \def\entry##1##2##3{%
    \multicolumn{##1}{l}{\underline{\hbox to ##2{\hfil##3\hfil}}}
    }
  \null
  \ifisanon%
  \author{}%
  \serialno{}%
  \enauthor{}%
  \supervisor{}%
  \cosupervisor{}%
  \ensupervisor{}%
  \encosupervisor{}%
  \else\relax\fi%
  \pagenumbering{alph}% not display, for print only
  \thispagestyle{empty}%
  \begin{center}\leavevmode % 表格环境
  {\fangsong \wuhao[1.25]%
    \begin{tabular}{llcll}
    分类号  & \entry{1}{3.2cm}{\@classification} & \hspace*{4.8cm}%
    学号    & \entry{1}{3.2cm}{\@serialno}         \\[5mm]    %
    U\ D\ C & \entry{1}{3.2cm}{\@UDC} &            \hspace*{4.8cm}
    密级 & \entry{1}{3.2cm}{\@confidentiality}
    \end{tabular}
  }
  \par
  \vspace*{2.5cm} %插入空白
  {\heiti\sanhao \ifisprof{专业学位}\else\@papertype{}\fi\@optionpaperclass{}学位论文}\\
  \vspace{12bp}
  {\cusong\erhao[1.25] \@title \par}%
  \vspace{45bp} %从WORD中得来
  {\heiti \sihao
    \begin{tabular}{cp{8cm}c}
      \ifismaster
      \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{硕\hfill{}士\hfill{}生\hfill{}姓\hfill{}名}} &
      \else
      \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{博\hfill{}士\hfill{}生\hfill{}姓\hfill{}名}} &
      \fi
        {\fs \hfil\raisebox{-3.7ex}[0pt]{\@author}\hfil{}} & \\[3.2ex]
        \cline{2-2}
        \ifisprof
        \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{专\hfill{}业\hfill{}学\hfill{}位\hfill{}类\hfill{}别}} &
        \else
        \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{学\hfill{}科\hfill{}专\hfill{}业}} &
        \fi
        {\fs \hfil\raisebox{-3.7ex}[0pt]{\@subject}\hfil{}} & \\[3.2ex]
        \cline{2-2}
        \ifisprof
        \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{专\hfill{}业\hfill{}学\hfill{}位\hfill{}领\hfill{}域}} &
        \else
        \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{研\hfill{}究\hfill{}方\hfill{}向}} &
        \fi
        {\fs \hfil\raisebox{-3.7ex}[0pt]{\@researchfield}\hfil{}} & \\[3.2ex]
        \cline{2-2}
        \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{指\hfill{}导\hfill{}教\hfill{}师}} &
        {\fs \hfil\raisebox{-3.7ex}[0pt]{\@supervisor}\hfil{}} & \\[3.2ex]
        \cline{2-2}
      \ifx\@cosupervisor\@empty\else
      \raisebox{-3.7ex}[0pt]{\makebox[3cm][s]{协\hfill{}助\hfill{}指\hfill{}导\hfill{}教\hfill{}师}} &
          {\fs \hfil\raisebox{-3.7ex}[0pt]{\@cosupervisor}\hfil{}} & \\[3.2ex]
          \cline{2-2}
      \fi
    \end{tabular}
  }
  \end{center}%

  \par
  \vfill
  {\centering \cusong \sanhao \ifisanon{~}\else{国防科技大学研究生院}\fi\\[0.8em]
    {\@zhdate \par}%
  }
  \vspace{1mm}
  \cleardoublepage%
  \newpage
  \thispagestyle{empty}%

  \begin{center}\leavevmode
  \vfill\bfseries
  {\erhao[1.25] \@entitle \par}
  {\sanhao[1.25]
  \vfill\vfill\vfill\vfill\vfill\vfill
  \begin{tabular}{rl}
    Candidate:\ & {\textsf{\@enauthor}}\\
    \@optionas{}:\ & {\textsf{\@ensupervisor}}\\
    \ifx\@encosupervisor\@empty\else
      Associate \@optionas{}:\ & {\textsf{\@encosupervisor}} \\
    \fi
  \end{tabular}}
  \vfill\vfill\vfill\vfill
  {\sanhao[1.5]
A \ifisprof{thesis}\else{dissertation} \fi \\
Submitted in partial fulfillment of the requirements\\
for the \ifisprof{professional }\else{}\fi degree of \textsf{\@optionpaperclassen{} of \@enpapertype}\\
in \textsf{\@ensubject}\\
\makebox[\textwidth]{\ifisanon{~}\else{Graduate School of National University of %
Defense Technology}\fi}\\
\ifisanon{~}\else{Changsha, Hunan, P.\ R.\ China}\fi\\[5mm]
~\@endate~
  }
  \end{center}\vfill

\renewcommand{\baselinestretch}{1.5}%
\ifisanon{~}\else{%
  \cleardoublepage%
  \newpage
  \thispagestyle{empty}
  {\cusong \erhao \centering \ziju{12pt} 独创性声明 \par\vspace{2cm}}
  {\fangsong\xiaosi %
本人声明所呈交的学位论文是我本人在导师指导下进行的研究工
作及取得的研究成果。尽我所知，除文中特别加以标注和致谢的地方外，论文中
不包含其他人已经发表和撰写过的研究成果，也不包含为获得国防科技大学或
其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的
任何贡献均已在论文中作了明确的说明并表示谢意。\par
学位论文题目：\vbox{\hbox to11cm{\hfil \the\displaytitle \hfil}
  \protect\vspace{0.6truemm}\relax
  \hrule depth0pt height0.15truemm width11cm}\par
学位论文作者签名：\hrulefill\hrulefill\hrulefill\hrulefill\hrulefill
  \hfill 日期：\hfill\hfill 年\hfill 月 \hfill 日\hspace{1cm}\par}

  \vspace*{2cm}
  {\cusong \erhao \centering 学位论文版权使用授权书\par\vspace{2cm}}
  {\fangsong\xiaosi %
本人完全了解国防科技大学有关保留、使用学位论文的规定。
本人授权国防科技大学可以保留并向国家有关部门或机构送交论文的复印件和电子
文档，允许论文被查阅和借阅; 可以将学位论文的全部或部分内容编入有关数据库
进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。\par
（保密学位论文在解密后适用本授权书。）\par
学位论文题目：\vbox{\hbox to11cm{\hfil \the\displaytitle \hfil}
  \protect\vspace{0.6truemm}\relax
  \hrule depth0pt height0.15truemm width11cm}\par
学位论文作者签名：\hrulefill\hrulefill\hrulefill\hrulefill\hrulefill
  \hfill 日期：\hfill\hfill 年\hfill 月 \hfill 日\par
作者指导教师签名：\hrulefill\hrulefill\hrulefill\hrulefill\hrulefill
  \hfill 日期：\hfill\hfill 年\hfill 月 \hfill 日\par}
}\fi

  \normalsize % normal, 正文开始
  \def\@tabular{\wuhao[1.25]\old@tabular} % 之后表格字体使用5号
  \cleardoublepage%
  \newpage
  \thispagestyle{empty}

} % QED
\endinput
%%
%% End of file `nudtpaper.cls'.
