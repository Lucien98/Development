## 1st May
### difference between `input` and `include`
Please refer to [LaTeX: \include vs. \input](https://www.baeldung.com/cs/latex-include-vs-input)
I think the main difference is that `\include` starts a new `aux` file for each included files.

## 16 May
### split a latex document using parts and chapters - the `\part` command
[How to split a latex document using parts and chapters](https://tex.stackexchange.com/questions/35782/how-to-split-a-latex-document-using-parts-and-chapters).
#### TODO
  - [ ] how to make the bookmark of reference outside the last part
  - [ ] how to add a content to each part

## 17 May
### how to add a content to each part
Please refer to [minitoc on the part-page](https://tex.stackexchange.com/questions/34249/minitoc-on-the-part-page)

But there are still two pitfalls of this method

  
## 18 May
### depth of toc and bookmark
toc is the short for `table of contents`.

There're various command to set the depth of contents to be shown at toc and bookmark.

    % for bookmark
    \bookmarksetup{depth=0}
    \hypersetup{bookmarksdepth=0}
    % for toc? What are all these?
    \setcounter{secnumdepth}{5}
    \setcounter{tocdepth}{5}
    \printcontents[parts]{}{-1}{\setcounter{tocdepth}{5}}



### What are the differences between `intotoc` and `intobmk`
TODO

### method introduced in 17 May
#### Pitfalls
  - There's no numbering of the parts, i.e. I want to add `第一部分` before the title of the first part, but there's no numbering `第一部分`.
  - The bookmark of `参考文献` is included in the last part, that is, the bookmark of `参考文献` is a level lower than `part 4`(the last part), I wanna them at the same level.
  - 
#### Solutions
  - use `titleformat` command
    + combining `\renewcommand\thepart{\chinese{part}}` and `\titleformat{\part}
  {\centering\normalfont\Huge\bfseries}{第\thepart 部分\quad}{0pt}{}%\thepart`
    + please refer to [LaTeX使用titlesec宏包改变章节编号形式的方法](https://blog.csdn.net/anshang6566/article/details/101833423)
  - use `\bookmark[dest=\HyperLocalCurrentHref, level=-1]{参考文献}` command
    + please refer to [Prevent PDF bookmark entry [duplicate]](https://tex.stackexchange.com/questions/345612/prevent-pdf-bookmark-entry) and [[LaTeX] 把不编号章节加进目录和 PDF 书签](https://zhuanlan.zhihu.com/p/66434387)

### Summary
#### To add toc at each part


    % are these necessary? begin
    \usepackage{titlesec,titletoc}  

    \titleclass{\part}{top}
    \titleformat{\part}
      {\centering\normalfont\Huge\bfseries}{}{0pt}{}
    
    \setcounter{secnumdepth}{5}
    % are these necessary? end


    \part{应用技巧}
    \startcontents[parts]
    \printcontents[parts]{}{-1}{\setcounter{tocdepth}{5}}
    
    \include{Tex/chapter15}
    \include{Tex/chapter16}
    \include{Tex/chapter17}
    \include{Tex/chapter18}
    \stopcontents[parts]

#### to change the numbering of title
The following two functionalize the same.

    \CTEXsetup[number={\chinese{part}}]{part}
    \renewcommand\thepart{\chinese{part}}

and change the `titleformat` in [To add toc at each part](#to-add-toc-at-each-part) into 

    \renewcommand\thepart{\chinese{part}}
    \titleformat{\part}
      {\centering\normalfont\Huge\bfseries}{第\thepart 部分\quad}{0pt}{}%\thepart

#### make the bookmark of `参考文献` and `part` at the same level
Now the bookmark level of `part` is `-1`, and the bookmark level of `参考文献` is `0`.

First, before the `参考文献` starts, set the bookmark depth into a level that will not add `参考文献` into the bookmark using `\bookmarksetup{depth=-1}`.

Then, use `\bookmark[dest=\HyperLocalCurrentHref, level=-1]{参考文献}` to mannully set the bookmark and its level.

    \bookmarksetup{depth=-1}
    % \hypersetup{bookmarksdepth=-1} % works the same as the above line
    \intotoc*
    {\cleardoublepage}{\bibname}% add link to toc
    \artxifstreq{\artxbib}{bibtex}{% enable bibtex
        \bibliography{Biblio/ref}% bibliography
    }{%
        \printbibliography% bibliography
    }
    \bookmark[dest=\HyperLocalCurrentHref, level=-1]{参考文献}%
    
    
### `\multirow`
 the `*` in `\multirow{2}{*}{}` means  to use the natural width of the contents

the documents for `multirow`: [multirow – Create tabular cells spanning multiple rows](https://www.ctan.org/pkg/multirow)

[Missing borders when using multirow and multicolumn](https://tex.stackexchange.com/questions/246356/border-with-multirow-and-multicolumn): 
change `\multicolumn{3}{c}{}` into `\multicolumn{3}{c|}{}`

To prevent the two cmidrule from connecting each other in one end, we need to provide the trim parameter to \cmidurle command. The trim parameter is provide in () after the command, for example, \cmidrule(lr){2-4}, which means to trim in both left and right side of the rule. From [Creating A Professional Table in LaTeX with booktabs](https://jdhao.github.io/2019/08/27/latex_table_with_booktabs/)

    \cmidrule(){2-4}

## 20 May
### fontsize
  - `\small`
  - `\huge`
