# 1st May
## Number of compilation
To generate the final pdf document, LaTeX may compile for many times (4 times precisely), the explanation could be seen at 

1. [很多时候LaTeX为什么要进行多次编译？](https://www.zhihu.com/question/475204176).
2. [Latex引用参考文献出现问号，LaTex Warning: citation undefined](https://blog.csdn.net/sinat_29760727/article/details/107963173)

## How to avoid compiling for multiple times? Using sublime text.
Up to this day, I compile the thesis LaTeX project for many times at the start util there is no issue in the pdf file, i.e. the bibliography, caption works well in the file.

Then today I suddenly know, this is not a problem of sublime, it is the problem of LaTeX itself. Frankly speaking, this could not been seen as a problem, this is just me not familiar with the workflow of LaTeX.

To avoid multiple compilation to get the final pdf file, many methods have been proposed, most of them use the shell or batch scripts. These work allows us to not mannually compile the file many times. Instead, the work was done automatically by the script. However, it is still a time-comsuming task. So now, I introduce a method where we wait somewhat long time in the first compilation, and wait little time the other compilations.

First, change the `builder-settings` of `windows` (originally `windows: {},`) in `LaTeXTools.sublime-settings` into `windows:{""script_commands":["artratex.bat"]"}`. The `atratex.bat` could be found at [here](https://github.com/mohuangrui/ucasthesis/blob/master/artratex.bat), and we should change it according to [reference.md](./Reference.md). (And this change could be improved.)

Second, change the `"output_directory": ""` into `"output_directory": "Tmp"` in `LaTeXTools.sublime-settings`.

In the first compilation, press `ctrl + shif + b` and click `LaTex - Script Builder`.

And in other compilations, if your change in the project did not involve a lot of bibliography, caption, you could just press `ctrl + shif + b` and click `LaTex - XeLaTeX` or others.

