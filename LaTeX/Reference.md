## How to put reference in the end of every chapter
[LaTeX分章节独立参考文献](https://zhuanlan.zhihu.com/p/357607286)

### it works for OptAes
The `includeonly` command is not necessary, but the two usepackage command is necessary.

And here is the compile script:

	pdflatex Optimizing_TI_for_AES_Enes_Yao-V1.tex
	bibtex section1
	bibtex section2
	bibtex section3
	bibtex section4
	bibtex section5
	bibtex section6
	pdflatex Optimizing_TI_for_AES_Enes_Yao-V1.tex
	pdflatex Optimizing_TI_for_AES_Enes_Yao-V1.tex

`Ctrl + B` in sublime could not compile the project directly.

### it works for UCASThesis
1. Due to the difference of `\input` and `\include`, the main file of UCASThesis needs the following change:

	% \include{Tex/Mainmatter}% main content % comment this line

copy the following lines:

	%---------------------------------------------------------------------------%
	%->> Main content
	%---------------------------------------------------------------------------%
	\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
	\renewcommand{\thetable}{\thechapter-\arabic{table}}
	\renewcommand{\theequation}{\thechapter-\arabic{equation}}
	\include{Tex/chap1}
	\include{Tex/chap2}
	\include{Tex/chap3}
	\include{Tex/chap4}
	\include{Tex/chap5}
	%---------------------------------------------------------------------------%

These lines are copied from Tex/Mainmatter.tex with `\input` replaced by `\include`

2. Add the following two lines to the end of every chapter:

config style and the bib file location

    \bibliographystyle{plain}
	\bibliography{Biblio/ref}

3. chang the atratex.bat

comment and add some lines:

	rem bibtex ./Tmp/%FileName% # comment this line
	bibtex ./Tmp/Tex/chap1
	bibtex ./Tmp/Tex/chap2
	bibtex ./Tmp/Tex/chap3
	bibtex ./Tmp/Tex/chap4
	bibtex ./Tmp/Tex/chap5

4. change style/atratex.sty
change
`\RequirePackage[sort&compress]{natbib}% numbered citation mode` into `\RequirePackage[sort&compress,square,numbers,sectionbib]{natbib}% numbered citation mode`

Remark: 

- There are several bibliographystyle: `plain`(see in chapterbib branch of MasterThesis), `alpha`(see in optaes).
- How to build latex file in sublime with a script, avioding compiling for a long time every compilation. Please refer to [compilation.md](./Compilation.md)

## 2nd May
### Difference between `\citep`, `\cite` and `\citet`
`\citet`: with author

How does the command `\citepns` in atratex.sty work? (TODO)
