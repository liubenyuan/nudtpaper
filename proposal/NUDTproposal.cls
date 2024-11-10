
%%%%***************************** Version Information ********************************
%%
%% Proposal template created by <hzzmail@163.com>
%% 2024.09.24
%% Some codes origin from nudtproposal by Hanlin Tan <hanlin_tan@nudt.edu.cn>
%% 2024.11.07
%% Adjusted and adapted to the June 2023 template for the Graduate School 
%% by Yang Ding <yangding12@nudt.edu.cn>


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{NUDTproposal}[2024/09/24 v1.0 A simple proposal document class for NUDT]

\LoadClass[12pt]{article}
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
\RequirePackage[stixtwo]{fontsetup}
\setmainfont{Times New Roman}%设置全局默认字体

\RequirePackage{pifont}
%\RequirePackage{amsmath,amssymb,amstext}
\RequirePackage{ctex,CJKfntef}
\setCJKfamilyfont{MyCJKfzxbs}{FZXiaoBiaoSong-B05S} %方正小标宋简体,用于首页"国防科技大学"和扉页"说明"
\setCJKfamilyfont{MyCJKsyht}{Source Han Sans CN Heavy} %思源黑体heavy，用于首页加粗黑体字体
\newcommand{\fzxbs}{\CJKfamily{MyCJKfzxbs}}  
\newcommand{\syht}{\CJKfamily{MyCJKsyht}}  

\RequirePackage{geometry}
\geometry{a4paper,includeheadfoot,top=15mm,bottom=25.4mm,left=31mm,right=31mm}%
\geometry{headheight=7.7mm,headsep=4.3mm,footskip=7.9mm,voffset=0mm}
%\usepackage[type=alledges]{fgruler}

\RequirePackage{enumitem}
\AddEnumerateCounter{\chinese}{\chinese}{}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{ctable,makecell,array,longtable,booktabs}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\graphicspath{{Img/}}% search path for figures
\RequirePackage{subcaption}% subcaption package for subfigures
\RequirePackage[section]{placeins}% to prevent floats from being moved over section
\captionsetup[figure]{labelfont={},name={图 },labelsep=space}
\captionsetup[table]{labelfont={},name={表 },labelsep=space}

\RequirePackage{fancyhdr} % 设置正文页眉
\fancyhf{}
\fancyhead[C]{\songti 国防科技大学研究生学位论文开题报告%
\\\centerline{\rule[5pt]{\textwidth+3mm}{0.7pt}}}%
\fancyfoot[C]{- \thepage \ - }
\renewcommand{\headrulewidth}{0pt}% header rule
\renewcommand{\footrulewidth}{0pt}% footer rule

\RequirePackage{etoolbox}
\RequirePackage{draftwatermark} %用其绘制框线
\numgdef\sectionpage{0}
\numgdef\pageafsecseven{10000}
\newcommand\FrameforSectionWM{%
\ifboolexpr{ test {\ifnumequal{\sectionpage}{0}}
or test {\ifnumequal{\value{section}}{5}}
or test {\ifnumequal{\value{section}}{6}}
or test {\ifnumgreater{\value{page}}{\pageafsecseven}}
}
{}{%
\ifnumequal{\value{page}}{\sectionpage}
{\tikz{\draw[line width=0.7pt] (0,0) rectangle (\textwidth+2mm,\textheight-0.6cm);}}
{\tikz{\draw[line width=0.7pt] (0,0) rectangle (\textwidth+2mm,\textheight+0.5mm);}}%
}%
}
\DraftwatermarkOptions{anchor=lb, pos={3cm,26.45cm},markcmd=\FrameforSectionWM}

\RequirePackage{titlesec}
\titleformat{\section}{\heiti\zihao{-4}}{\zhnum{section}、}{0pt}{}[\numgdef\sectionpage{\number\value{page}}
\ifnumequal{\value{section}}{7}{\numgdef\pageafsecseven{\number\value{page}}}{}]
\titlespacing*{\section}{-1mm}{0ex}{.2ex} % 设置标题前后间距
\titleformat{\subsection}{\kaiti \zihao{5}}{\arabic{subsection}.}{5 pt}{}
\titlespacing*{\subsection} {2em}{0ex}{6pt}
\titleformat{\subsubsection}{\songti \zihao{5}}{\arabic{subsubsection}}{5 pt}{}
\titlespacing*{\subsubsection} {2em}{0ex}{.2ex}

\RequirePackage{hyperref}
\hypersetup{% set hyperlinks.
    unicode=true,% allows non-Latin based languages in bookmarks % Use unicode for links
    pdffitwindow=false,% window fit to page when opened
    pdfstartview={FitH},% fits the width of the page to the window
    colorlinks=true,% false: boxed links; true: colored links
    linktoc=all, % Toc entries and numbers links to pages
	breaklinks=true,
    citecolor=blue,% color of links to bibliography
    bookmarksnumbered=true,% put section numbers in bookmarks
	pdfborder={0 0 0}, % Suppress border around pdf
	bookmarksdepth=paragraph,
	bookmarksopen=true,
}

% 参考文献
\RequirePackage[backend=biber,style=gb7714-2015,
gbpub=false,url=false,gbnamefmt=lowercase]{biblatex} % 设定引用格式
\RequirePackage{biblatex-ext-tabular}

\let\upcite=\cite
\newlength\tabrowheight
\setlength\tabrowheight{1cm}

\defbibtabular{bibtabular}
  {\setlength{\LTpre}{0pt}%
   \setlength{\LTpost}{0pt}%
   \begin{longtable}{%
     @{}|@{}m{0.10\textwidth}@{}| % < {\centering}
      m{0.88\textwidth}@{}|@{}}
     \hline
     {\kaiti \parbox[c][\tabrowheight][c]{0.10\textwidth}{\centering 序号} }
     & {\kaiti\parbox[c][\tabrowheight][c]{0.86\textwidth}{\centering 文献目录(作者、题目、刊物名、出版时间、页次)}  } \\
     \hline
     \endfirsthead}
  {\end{longtable}}
  {\parbox[c][\tabrowheight][c]{0.10\textwidth}{\centering \anchorlang{\mkgbnumlabel{\printfield{labelnumber}}}}
  & \parbox[c][\tabrowheight][c]{0.86\textwidth}{\driver{}}\\\hline}

\ExplSyntaxOn

%获取node内部的文本行数存入counter：linesinnode中
\newdimen\mydimxs
\newdimen\mydimxe
\newdimen\myheight
\newcounter{linesinnode}
\NewDocumentCommand {\getnodedimen} {m} {
  \pgfextracty{\mydimxs}{\pgfpointanchor{#1}{south~west}}
  \pgfextracty{\mydimxe}{\pgfpointanchor{#1}{north~east}}
  \pgfmathsetlength{\myheight}{\mydimxe-\mydimxs+\baselineskip-0.9\ccwd}%\the\myheight
  \setcounter{linesinnode}{\numexpr\myheight/\baselineskip\relax}
}

%记录表格标签的宽度、表格中node的基点位置
\newlength\rowlabelwidth
\setlength\rowlabelwidth{69pt} %指定宽度，宽度小一点可以压缩全角冒号标点所占的空间
\def\lastrowbasepoint{\pgfpointadd{\pgfpointanchor{current~page}
{north~west}}{\pgfpoint{6.55cm}{-14cm}}}%\pgfpointorigin

%tikz节点样式
\tikzstyle{multirow}=[inner~sep=0pt,minimum~width=295pt,
anchor=north~west,font=\fangsong]%draw=blue,
\tikzstyle{singlerow}=[inner~sep=0pt,minimum~width=295pt,minimum~height=\baselineskip, text~height=\baselineskip-0.5mm,text~depth=0.1\baselineskip,
font=\fangsong,anchor=north~west]
\tikzstyle{singleshortrow}=[inner~sep=0pt,minimum~width=112pt,
minimum~height=\baselineskip,text~height=\baselineskip-0.5mm,
text~depth=0.1\baselineskip,font=\fangsong,anchor=north~west]
\tikzstyle{singlelabel}=[inner~sep=0pt,minimum~width=69pt,minimum~height=\baselineskip, text~height=\baselineskip-0.5mm,text~depth=0.1\baselineskip,anchor=north~east]
\tikzstyle{lineunderrow}=[black]

%绘制带多行文本的行
\NewDocumentCommand \nodeonepairmultirow {m m} {
    \pgfcoordinate{BasePoint}{\lastrowbasepoint}
    \node [multirow] (noderightX) at (BasePoint) {\parbox{280pt}{\centering #2}};
    \getnodedimen{noderightX}
    \foreach \x in {1,...,\thelinesinnode} {
        \draw [lineunderrow]
        ($(noderightX.south~east)+(0,\numexpr\x-1\relax\baselineskip-0.5mm)$) -- ($(noderightX.south~west)+(0,\numexpr\x-1\relax\baselineskip-0.5mm)$);
    }
    \node[inner~sep=0pt,anchor=north~east,minimum~width=69pt]  (nodeleft)  at (noderightX.north~west){\makebox[\rowlabelwidth][s]{#1}};
    \def\lastrowbasepoint{\pgfpointanchor{noderightX}{south~west}}
}

%绘制带单行文本的行
\NewDocumentCommand \nodeonepairsinglerow {m m} {
    \pgfcoordinate{BasePoint}{\lastrowbasepoint}
    \node[singlerow]  (noderight) at (BasePoint)
    {\parbox{280pt}{\centering #2}};
    \draw [lineunderrow] ($(noderight.south~east)+(0,-0.5mm)$)
    -- ($(noderight.south~west)+(0,-0.5mm)$);
    \node[singlelabel]  (nodeleft)  at
    (noderight.north~west){\makebox[\rowlabelwidth][s]{#1}};
    \def\lastrowbasepoint{\pgfpointanchor{noderight}{south~west}}
}

%绘制带单行文本的行，但有两列
\NewDocumentCommand \nodedblpairsinglerow {m m m m} {
    \pgfcoordinate{BasePoint}{\lastrowbasepoint}
    \node[singleshortrow]  (noderight) at (BasePoint)
    {\parbox{125pt}{\centering #2}};
    \draw [lineunderrow] ($(noderight.south~east)+(0,-0.5mm)$) --
    ($(noderight.south~west)+(0,-0.5mm)$);
    \node[singlelabel]  (nodeleft)  at
    (noderight.north~west){\makebox[\rowlabelwidth][s]{#1}};
    \node[singlelabel,anchor=north~west]  (noderighta)
    at (noderight.north~east){\makebox[\rowlabelwidth-20pt][s]{#3}};
    \node[singleshortrow]  (noderightb) at (noderighta.north~east)
    {\parbox{105pt}{\centering #4}};
    \draw [lineunderrow] ($(noderightb.south~east)+(0pt,-0.5mm)$)
    -- ($(noderightb.south~west)+(-20pt,-0.5mm)$);
    \def\lastrowbasepoint{\pgfpointanchor{noderight}{south~west}}
}

%绘制带单行文本的行，但有七列
\NewDocumentCommand \nodesvlpairsinglerow {m m m m m m m} {
    \pgfcoordinate{BasePoint}{\lastrowbasepoint}
    \node[singleshortrow]  (noderight) at ($(BasePoint.south~east)+(-10pt,-0mm)$)
    {\parbox{80pt}{\centering #2}};
    \draw [lineunderrow] ($(noderight.south~east)+(-5pt,-0.5mm)$) --
    ($(noderight.south~west)+(10pt,-0.5mm)$);
    \node[singlelabel]  (nodeleft)  at
    (noderight.north~west){\makebox[\rowlabelwidth-20pt][s]{#1}};

    \node[singlelabel,anchor=north~west]  (noderighta)
    at ($(noderight.north~east)+(-20pt,-0mm)$){\makebox[\rowlabelwidth-40pt][s]{#3}};


    \node[singleshortrow]  (noderightb) at ($(noderight.north~east)+(-5pt,0mm)$)
    {\parbox{50pt}{\centering #4}};
    \draw [lineunderrow] ($(noderightb.south~east)+(-20pt,-0.5mm)$)
    -- ($(noderightb.south~west)+(25pt,-0.5mm)$);

    \node[singlelabel,anchor=north~west]  (noderighta)
    at ($(noderight.north~east)+(80pt,0mm)$){\makebox[\rowlabelwidth-20pt][s]{#5}};
%$(BasePoint.south~east)+(-20pt,-0.5mm)$
    \node[singleshortrow]  (noderightb) at ($(noderight.north~east)+(90pt,0mm)$)
    {\parbox{50pt}{\centering #6}};
    \draw [lineunderrow] ($(noderightb.south~east)+(-25pt,-0.5mm)$)
    -- ($(noderightb.south~west)+(20pt,-0.5mm)$);

    \node[singlelabel,anchor=north~west]  (noderighta)
    at ($(noderight.north~east)+(170pt,0mm)$){\makebox[\rowlabelwidth-20pt][s]{#7}};
    \def\lastrowbasepoint{\pgfpointanchor{noderight}{south~west}}

}

%定义两套Key-value设置，一套是NUDTlabelset，一套是NUDTvalueset
%前者用于在模板中定义，后者则作为用户接口
\NewDocumentCommand\definekey{mm}{\keys_define:nn { #1 }{#2 .tl_set:c = { l_#1_#2_tl }}}
\NewDocumentCommand\NUDTlabelset{m}{\keys_set:nn {NUDTlabel} { #1 }}
\NewDocumentCommand\NUDTvalueset{m}{\keys_set:nn {NUDTvalue} { #1 }}
\clist_const:Nn \l_NUDT_keys {author,title,author,title,schoollogo,schooltext,
proposaltype,classification,proposalnumber,authorid,major,field,advisor,
advisortitle,institute,date,dateyear,datemonth,dateday,formdate,mark}%在clist中定义key
\clist_map_inline:Nn \l_NUDT_keys{\definekey{NUDTlabel}{#1}}
\clist_map_inline:Nn \l_NUDT_keys{\definekey{NUDTvalue}{#1}}

%设置标签信息
\NUDTlabelset
{   author={姓名：},
    title={论文题目：},
    schoollogo={},
    schooltext={},
    proposaltype={},
    classification={密级：},
    proposalnumber={编号：},
    authorid={学\hspace{2em}号：},
    major={学科专业：},
    field={研究方向：},
    advisor={指导教师：},
    advisortitle={职称：},
    institute={学\hspace{2em}院：},
    date={开题时间：},
    dateyear={年},
    datemonth={月},
    dateday={日},
    formdate={二〇二三年六月},% 制表月份
    mark={}, %XXX大学研究生院制
}

%封面的命令
%注意：其中不同元素的定位根据模板的要求来设置
\NewDocumentCommand\makecover{}{
\newpage\thispagestyle{empty}\noindent
%\begin{tikzpicture}[remember~picture,overlay]
%\node[inner~sep=0pt,draw=red,rectangle,align=center] at ($(current~page.center)$)
%{\includegraphics[width=\paperwidth]{kaiti1.pdf}};
%\end{tikzpicture}
\begin{tikzpicture}[remember~picture,overlay]
  \begin{scope}
    \linespread{2}
    \node[anchor=center] at ($(current~page.north~west)+(3.78cm,-3.68cm)$)
        {\l_NUDTvalue_schoollogo_tl};
    \node[font=\zihao{4}\mdseries\heiti] at
        ($(current~page.north~east)+(-4.7cm,-3.68cm)$)
        {\begin{tabular}{c c}
        \l_NUDTlabel_classification_tl &   {\fangsong\l_NUDTvalue_classification_tl} \\
        \l_NUDTlabel_proposalnumber_tl &   {\fangsong\l_NUDTvalue_proposalnumber_tl} \\
       \end{tabular}};
  \end{scope}
  \begin{scope}
    \node[] at ($(current~page.north~west)+(10.50cm,-7.75cm)$)
        {\fzxbs\zihao{1} 国防科技大学};
    \node[] at ($(current~page.north~west)+(10.3cm,-11.3cm)$)
       {\syht\fontsize{28}{17}\selectfont
       \begin{tabular}{c}
        \l_NUDTvalue_proposaltype_tl \\
        \\~
        开题报告\\
       \end{tabular}};
    \linespread{1.68}\zihao{3}\syht
    \nodeonepairmultirow{\l_NUDTlabel_title_tl}{\l_NUDTvalue_title_tl}
    \nodedblpairsinglerow{\l_NUDTlabel_authorid_tl}
        {\l_NUDTvalue_authorid_tl}{\l_NUDTlabel_author_tl}
        {\l_NUDTvalue_author_tl}
    \nodeonepairsinglerow{\l_NUDTlabel_major_tl}
        {\l_NUDTvalue_major_tl}
    \nodeonepairsinglerow{\l_NUDTlabel_field_tl}
        {\l_NUDTvalue_field_tl}
    \nodedblpairsinglerow{\l_NUDTlabel_advisor_tl}
        {\l_NUDTvalue_advisor_tl}{\l_NUDTlabel_advisortitle_tl}
        {\l_NUDTvalue_advisortitle_tl}
    \nodeonepairsinglerow{\l_NUDTlabel_institute_tl}
        {\l_NUDTvalue_institute_tl}
    %\nodeonepairsinglerow{\l_NUDTlabel_date_tl}{\l_NUDTvalue_date_tl}
    \nodesvlpairsinglerow{\l_NUDTlabel_date_tl}{\l_NUDTvalue_dateyear_tl}
        {\l_NUDTlabel_dateyear_tl}{\l_NUDTvalue_datemonth_tl}
        {\l_NUDTlabel_datemonth_tl}{\l_NUDTvalue_dateday_tl}
        {\l_NUDTlabel_dateday_tl}
    \node[] at ($(current~page.north~west)+(10.5cm,-26cm)$)
        {\linespread{1.7}\zihao{-3}\heiti
        \begin{tabular}{p{400pt}<{\centering}}
        {\mdseries\l_NUDTvalue_mark_tl}  \\
        {\mdseries\l_NUDTlabel_formdate_tl}
        \end{tabular}};
  \end{scope}
\end{tikzpicture}
  \clearpage

  %%%% 说明页
\pagestyle{fancy}
\begin{center}
    {\fzxbs\zihao{2} 说 \hspace{1.5em} 明}
\end{center}

{\setlength\parskip{0pt}
\songti\zihao{-4}
\SetEnumitemKey{noenumsep}{topsep=0pt,parskip=0pt,partopsep=0pt,listparindent=0em}
\begin{enumerate}[label={\chinese*、\hspace{-.5em}},leftmargin=4em,parsep=0pt,itemsep=2em]
\item 开题报告应按下述要求打印后装订成册：
    \begin{enumerate}[label={\arabic*.},leftmargin=-.8em,parsep=0pt,itemsep=0em]
    \item 	使用A4白纸，双面打印；
    \item 	封面中填写内容使用三号仿宋字体；
    \item 	表中填写内容使用小四号宋体字体。
    \end{enumerate}
\item 编号由学院教学科研处（教务处）填写，由9位数字组成。\\

\hspace*{-2em}\underline{2311}\quad \underline{02}\quad \underline{001}\quad 计算机学院于2023年11月审批的第一份开题报告\\
\hspace*{-1.5em} \ding{172} \hspace*{1.8em} \ding{173} \hspace*{1.5em} \ding{174}

    \begin{itemize}[leftmargin=-4em,itemindent=3.5em,parsep=0pt,itemsep=0em]
    \item[\ding{172}:] 	审批时间代码。精确到年月，如2311代表审批时间为2023年11月；
    \item[\ding{173}:]  审批单位代码。01-理学院，02-计算机学院，03-电子科学学院，04-前沿交叉学科学院，05-智能科学学院，06-系统工程学院，07-空天科学学院，08-国际关系学院，09-信息通信学院，10-电子对抗学院，11-气象海洋学院，12-军政基础教育学院，00-其他单位；
    \item[\ding{174}:]  审批流水号代码。
    \end{itemize}

\end{enumerate}}
\pagenumbering{arabic}
\newpage
}
\ExplSyntaxOff


\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
\renewcommand{\baselinestretch}{1.4} % line space setting

\endinput
