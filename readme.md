# ![nudtpaper](figures/logo.png)

*A latex template for writing NUDT master/doctorial thesis*

## 1. Introduction

Use `nudtpaper.cls` directly and modify **your** `thesis.tex`. The contents in `makefile` may help you with the compiling procedure. Any third party packages or macros can be added in `mynudt.sty`.

**About Fonts:** FZ fonts are best for printing (your final version).

## 2. Contribute to NUDTpaper

**Fork** this project and commit a **pull** request (**PR**)!

If `nudtpaper` helps you, please give it a **star**!


## 3. 开题报告简要指南

+ 开题报告模板在 proposal 目录下
+ 开题报告格式与内容完全分离，使用非常简单，按正常latex文档写即可
+ 开题报告格式若与要求的格式差异较大时，请及时反馈

## 4. 学位论文简要指南


### 1) 学位类型选项

+  **master**    硕士论文(默认是学位论文)
+  **doctor**    博士论文(默认是学位论文)
+  **prof**      专硕(若是专硕，则加上此选项)
+  **graduate**  毕业论文(若论文用于毕业而不是申请学位则加上此选项，注意毕业论文对应的独创性说明也需要调整)

### 2) 页面选项

+  **twoside**   双面打印，章节从单数页开始(**博士论文的默认要求**)。不使用该选项，则章节是连续的，无空白页。
+  **spline**    输出书脊，用于查重版本。查重论文需要在封面背面有一个带框书脊。使用该选项后会插入a3cover目录下的spineinthesis.pdf，该pdf在a3cover下利用对应的spineinthesis.tex文件生成(需输入论文标题信息)。生成方法为：编辑a3cover文件夹中的spineinthesis.tex文件，运行makeothers.bat，得到的spineinthesis.pdf即为a4大小的书脊页。


### 3) 字体选项(注意：若提示默认使用的字体不存在则尝试切换选项或根据所缺字体下载安装)

+  **ttf**       使用windows的字体
+  **otf**       使用Adobe字体
+  **fz**        使用方正字体(需要自己安装字体，下载见[地址](https://github.com/liubenyuan/nudtpaper/issues/67))
+  **fandol**    使用fandol字体


### 4) 版本/生成选项

+  **anon**      盲评版本论文选项，用于评阅(其中成果信息全部隐去)。
+  **blind**     系统提交的盲评版本，在使用anon选项后，添加blind选项会列出“第一作者，XXX”为作者列表的相关成果信息。
+  **不使用anon和blind选项时** 为明评版本，所有信息均提供，也包括独创性声明。生成明评版本前需在a3cover目录下生成(或扫描得到)originalitystatement.pdf，生成查重版本需在a3cover目录下生成spineinthesis.pdf。
+  独创性声明**只需要保密审查时的签字版本**(也就是其签字时间应于保密审查时间一致，这一版本扫描后可以在后续评阅、打印中一直使用)，明评版本默认插入a3cover目录下的originalitystatement.pdf文件。最终版本，则利用签字扫描版替换利用tex生成的pdf。
+  **biber**     参考文献使用biblatex生成。不使用该选项时，则参考文献默认用bibtex生成。
+  **resumebib** 在使用biber选项时，使用resumebib选项，则成果列表信息也用biblatex生成，也就是利用一个bib文件维护成果信息，格式由模板设定。当不使用biber和resumebib时，成果列表需在data目录下的resume.tex中手工输入。由于成果列表信息的格式要求与参考文献格式要求相同，因此推荐使用biblatex生成成果列表。保存成果信息的bib文件是ref目录下的resume.bib文件，注意其中使用了author+an的数据注解方式来突出显示论文作者。


### 5) 打印材料、封面、书脊

+  主目录下有 thesis.pdf 是生成的各种版本的学位论文，用于打印。 
+  a3cover 目录下有a3cover.pdf，即a3封面pdf但不一定用得到(银河工厂通常会有制作)。a3cover.pdf 由 a3cover文件夹下的a3cover.tex生成，该文件只是引入spline和thesis文件的内容，所以无需改动，只需要在同目录下生成书脊文件即 spine.pdf，该文件由 spine.tex文件编辑后生成。
因此，整个运行顺序为：编辑spine.tex文件->运行makeothers.bat生成spine.pdf->生成论文主体thesis.pdf->运行makecover.bat生成a3cover.pdf.
+  a3cover 目录下有spinenoframe.pdf，即不带框的书脊页，打印时可能用得到。可以在编辑spinenoframe.tex后，利用运行makeothers.bat生成。
+  a3cover 目录下有originalitystatement.pdf，即独创性声明文件，当不给出指定的信息时则是一个空表，可用于打印后签字。该文件已经与最新模板的word版本做精确对比，已无明显差异。


### 6) 其他宏包

+  算法宏包除了默认algorithmic外，也可以使用algorithm2e。可以在mynudt.sty中更换，比如将
```
\RequirePackage[chapter]{algorithm}
\RequirePackage{algorithmic}
```
更换为：
```
\usepackage[ruled,linesnumbered,algochapter]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\SetFuncArgSty{textrm}
\SetArgSty{textrm}
\let\subfigure=\subfloat
```
+  旁注一般不使用，脚注和尾注，可以使用自行设置。比如：
```
\usepackage{marginnote}
\renewcommand*{\marginfont}{\footnotesize\color{red}\sffamily}

\counterwithout{footnote}{chapter}
\usepackage{xcolor}
\usepackage{circledtext}
\circledtextset{resize=real,height=1.5ex,boxcolor=blue,charcolor=blue,boxlinewidth=1pt}
\makeatletter
\renewcommand\thefootnote{\circledtext*{\@arabic\c@footnote}}
\makeatother

%使用endnotes包的尾注
%\usepackage{endnotes}
%\def\enoteheading{}
%\renewcommand\makeenmark{\textsuperscript{\circledtext{\theenmark}}}
%输出时用\theendnotes %用于endnotes宏包

%使用enotez包的尾注
\usepackage{enotez}
\setenotez{%设置宏包选项
backref=true,
list-name={},%把标题尾注内容改为一条线
%reset = true,%每次\printendnotes后重设序号
counter-format=arabic,%数字的样式是阿拉伯数字
mark-format= {\circledtext[boxcolor=blue,charcolor=blue]},  %带圈符号
list-heading={},%设置尾注标题的格式
list-style = {custom}
}
%定义需要的序号方式，比如带圈，带括号什么的。
\DeclareInstance{enotez-list}{custom}{paragraph}
{
heading = {},
notes-sep = {4pt} ,%这是各个尾注之间的间距
format = \normalsize ,
number = \textsuperscript{\circledtext[boxcolor=blue,charcolor=blue]{#1}}
}
%输出时用\printendnotes[custom] %用于enotez宏包
```

+  符号列表可以手工输入，也可以利用nomencl等宏包生成。


+  pdf文档的元信息可用hypersetup自行输入，比如：

```
\hypersetup{
pdftitle={the title},
pdfauthor={author’s name},
bookmarksdepth=subsubsection,
bookmarksopen=true, % Expand the bookmarks as soon as the pdf file is opened
bookmarksopenlevel=4,
}
```


+  一些默认没有的书签信息可自行给出。比如：
```
\pdfbookmark[1]{封面}{pdftag:titlepage}
```
