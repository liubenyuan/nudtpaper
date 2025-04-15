

+ 生成a3大小封面文件用于论文胶装

a3cover文件夹中a3cover.tex文件用来生成a3大小的封面，该文件无需修改，但编译生成时需要用到书脊，所以要首先生成书脊，书脊由同目录下的spine.tex文件中编辑后生成.

因此，运行顺序为：编辑spine.tex文件->运行makeothers.bat生成spine.pdf->生成论文主体thesis.pdf->运行makecover.bat生成a3cover.pdf.

生成的a3cover.pdf文件可直接用于打印封面并胶装。


+ 在论文正式版中加入书脊页

编辑a3cover文件夹中的spineinthesis.tex文件，运行makeothers.bat，得到的spineinthesis.pdf即为a4大小的书脊页，同时主论文thesis中需要加入spline选项。