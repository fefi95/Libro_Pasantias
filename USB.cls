%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Original Instructions And Hints
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This file provides the LaTeX2e style myeasychithesis for formating
% graduate thesis at the University Putra Malaysia. It was written by
% Rand Alfaris. For an example of its use see the
% file: Randtemplate.tex, and the instructions below.
%
% Comments or problems should be sent to randalfaris@gmail.com
%
%
% Invoking this style:  Start your document with (this is 1.5 spaced)
%
%   \documentclass{myeasychithesis2}
%
% You should submit a double-spaced thesis.  So, start with
%
%   \documentclass[truedoublespace]{myeasychithesis2}
%
% When printing drafts, you may not want your thesis doublespaced.
% If you use instead:
%
%   \documentclass[singlespace]{myeasychithesis2}
%
% or
%
%   \documentclass[onehalfspace]{myeasychithesis2}
%
% your thesis will come out single or 3/2 spaced respectively.
% myeasychithesis2 also understands all options understood by report.
% Also the ``double spacing'' provided by this style is not ``true''
% doublespacing as defined by setspace.sty.  Instead, it is the same
% as on the old LaTeX 2.09 thesis style ``chithesis''.  If you want
% ``true'' double spacing, give the option truedoublespace.
%
% Title Page Information Commands
%    Example Usage:
%       \title{Decimal numbers on cryptography}
%       \author{Rand Q. Alfaris}
%       \department{Mathematics}
%       \division{Pure Mathematics}  (Sciences with an s!)
%       \degree{Doctor of Philosophy}
%       \date{}    
%       \maketitle
%
% \dedication : Use for a dedication, copyright, or epigraph.
%               Produces a page with no number for the text which follows
%               If you want centering, do it yourself with
%               \begin{center} and \end{center}.
%        Usage:
%           \dedication
%           To... .
%
% \topmatter : Things like Abstract, Acknowledgments.
%    Usage:
%       \topmatter{Title Of Matter}
%
%       Use like \chapter, once for each page of matter you want.  Don't
%       use numbered sections within these.  Use \section* instead.
%
% The abstract environment has been changed to invoke \topmatter.
% The acknowledgment environment has been changed to invoke
% \topmatter, use it like the aastex acknowledgment command but put
% it at beginning of document for a UPM Thesis
%
% \mainmatter : Signals the start of the document's body.
%    Usage:
%       \mainmatter
%
%       Use once before the first numbered \chapter.
%
%  HINTS:
%
%  1.  To get appendices, you don't do anything different from a normal
%     report document.  That means, put the command \appendix before
%     you begin your first appendix, then do each appendix with a
%     \chapter command.  Note that if you have only one appendix, it is
%     customary to leave it unnumbered.  Do this with \chapter*.
%
%  2. If you are having page break problems (which are much more
%     likely in double spacing), use the \pagebreak[n] and
%     \nopagebreak[n] commands to tell LaTeX good and bad 
%     places for page breaks. n=1,2,3 for gradually more
%     emphatic suggestion to LaTeX. n=4 is almost always
%     break page or almost never break page.
%
%  3. If you are in a rush and don't have time to go through and
%     rework places which generate overfull hboxes (stuff sticking
%     out from right margin), put the command \sloppy before your
%     \begin{document}. LaTeX will not generate overfull hboxes but will
%     stretch spaces more, beyond its usual aesthetic preferences.
%
%  KNOWN PROBLEMS
%
%  1.  No support for multi-volume theses.
%
%  2.  Doesn't work with older versions of setspace.sty
%
%  3.  Problems with math formulas in chapter headings:
%
%         a.  Any lowercase letters in the formula are converted to
%         uppercase, e.g. f(x) becomes F(X).   If you really need
%         lowercase math letters in your chapter titles, use the
%         option plainchapterheads (and, if you want, type your
%         chapter titles in ALL CAPS so that the appearance doesn't
%         change).  Note there is no problem
%         for section or subsection headings in either case.
%
%         b.  Some perfectly reasonable math commands when used in
%         \chapter give the error
%          ``LATEX ERROR: \command  ALLOWED ONLY IN MATH MODE.''
%         The solution to this is to do
%
%              \newcommand{\mymath}{problem math goes here}
%
%         and then
%
%              \chapter{All about \protect\mymath}
%
%         also, the option plainchapterheads will fix this too.
%
%  Improvements over older versions:
%
%  Added in 1.4: Name of the bibiography is now References, to please the
%  thesis office.  If you want to change it back, put
%
%   \renewcommand{\bibname}{Bibliography}
%
%  in your TeX file prior to \begin{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{USB}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                               PAQUETES                                %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[utf8]{inputenc} 
\usepackage{indentfirst}
\usepackage{fancyhdr}
% \usepackage{showframe}

\RequirePackage{setspace}[1998/04/8]
\newcommand{\etptsize}{12pt}
\DeclareOption{12pt}{\renewcommand{\etptsize}{12pt}}
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{report}}
\DeclareOption{plainchapterheads}{\renewcommand{\etchapterheadstyle}[1]{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                                ÍNDICE                                 %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\addtocontents{toc}{\addvspace{0.5cm}}
\addtocontents{toc}{\addvspace{0.2cm}}

% This option puts "CHAPTER" and "APPENDIX" headings into the TOC.
% LaTeX omits them by default.  (RAND)

\let\iftocflag=\iffalse
\DeclareOption{tocchapterhead}{\let\iftocflag=\iftrue}

\newcommand{\topmatter}[1]{
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                             LISTA DE TABLAS                           %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\addtocontents{lot}{\addvspace{0.5cm}{}\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                            LISTA DE FIGURAS                           %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\addtocontents{lof}{\addvspace{0.5cm}{}\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                               ESPACIOS                                %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\baselinestretch}{1.5}
\newcommand{\etspacing}{\setstretch{2}}
\newcommand{\linespacing}{2}
\newcommand{\normalspacing}{1.5}
\newcommand{\tablespacing}{2}
\newcommand{\algorithmspacing}{1.05}
\newcommand{\preamblespacing}{1.1}
\newcommand{\proofindent}{0pt}
\DeclareOption{truedoublespace}{\renewcommand{\etspacing}{\doublespacing}}
\DeclareOption{doublespace}{\renewcommand{\etspacing}{\setstretch{2}}}
\DeclareOption{onehalfspace}{\renewcommand{\etspacing}{\onehalfspacing}}
\DeclareOption{singlespace}{\renewcommand{\etspacing}{\singlespacing}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                               OPCIONES                                %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pass all other options to report.cls.
\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{report}
}

% It would be better to have the following line next,
% rather than setting the defaults manually, but
% this would break early versions of LaTeX2e
%
\ExecuteOptions{12pt,letterpaper,doublespace}
\ProcessOptions\relax
\LoadClass[\etptsize]{report}

% RAND: Footnote modifications
% Lengthen continuation rule line for footnotes 
\RequirePackage[splitrule]{footmisc}%
% Add spacing between multiple footnotes, but make sure space isn't
% added between rule and notes.  This is a bit of a kludge.
\setlength{\footnotesep}{\baselineskip}
\let\oldfootnoterule = \footnoterule
\renewcommand{\footnoterule}{\kern 0.4\footnotesep\oldfootnoterule\kern-0.4\footnotesep}
% Make footnote numbers in footnotes regular size, as per ``modern practice''
\renewcommand{\@makefntext}[1]{\noindent\makebox[2.5em][r]{\@thefnmark.\ }#1}

% RAND: font size modifications, from Rand Alfaris
% Put it at document start, else some packages may clobber it.
% Dissertation Office says minimum should be 9pt for microfilming, but
% they didn't actually complain about the standard LaTeX sizes (12/8/6)
% that I used previously.  So 8pt isn't too much of a cheat.
\AtBeginDocument{\DeclareMathSizes{12}{12}{10}{8}}

% Adjust spacing of document

\etspacing
\setlength{\parindent}{15pt} 
\setlength{\parskip}{2pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Commands Defined For Use By Thesis Author
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% \dedication : Use for a dedication, copyright, or epigraph.
%               Produces a page with no number for the text which follows
%               If you want centering, do it yourself with
%               \begin{center} and \end{center}.
%
\newcommand{\dedication}{
        \chapter*{}
        \thispagestyle{empty}
}


%
% redefinition of abstract environment
%

%\renewenvironment{abstract}{\topmatter{Abstract}}{}
%\newenvironment{acknowledgments}{\topmatter{Acknowledgments}}{}

\newcommand{\frontmatter}{
    \clearpage
    \pagenumbering{roman}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \rhead{\thepage}
}

% \mainmatter : Signals the start of the document's body.
%    Usage:
%       \mainmatter
%
%       Use once before the first numbered \chapter.
%
\newcommand{\mainmatter}{
    \clearpage
    \pagenumbering{arabic}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \rhead{\thepage}
}

% Changing page style plain (Chapters)

\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \rhead{\thepage}
}

\renewcommand{\title}[1]{\gdef\@title{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\division}[1]{\gdef\@division{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\renewcommand{\date}[1]{\gdef\@date{#1}}

{
  \pagenumbering{roman}
  \addtocounter{page}{1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                              CAPÍTULOS                                %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Normally, the chapter heads are all uppercase, but sometimes
% this causes problems.  The following option changes
% the chapter heads to small caps instead.

\renewcommand{\chaptername}{CAPÍTULO}
\newcommand{\etchapterheadstyle}[1]{\MakeUppercase{#1}}

% NUMBERED CHAPTERS

\renewcommand{\@makechapterhead}[1]{{
  \vspace*{3cm}%
  \centering{\Large\bfseries \@chapapp\space \thechapter}
  \par\nobreak
  \interlinepenalty\@M
  \bfseries #1\par
  \vskip 10\p@
}}

% UNNUMBERED CHAPTERS
\renewcommand{\@makeschapterhead}[1]{{ 
  \centering\bfseries
  \par\nobreak
  \interlinepenalty\@M
  \bfseries #1\par\nobreak
  \vskip 10\p@
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                              SECCIONES                                %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                {-3.5ex \@plus -1ex \@minus -.2ex}%
                                {2.3ex \@plus.2ex}%
                                {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                {-3.25ex\@plus -1ex \@minus -.2ex}%
                                {1.5ex \@plus .2ex}%
                                {\normalfont\normalsize\bfseries}}                          
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                {-3.25ex\@plus -1ex \@minus -.2ex}%
                                {1.5ex \@plus .2ex}%
                                {\normalfont\normalsize\bfseries}}                          
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                {3.25ex \@plus -1ex \@minus -.2ex}%
                                {-1em}%
                                {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                {3.25ex \@plus -1ex \@minus -.2ex}%
                                {-1em}%
                                {\normalfont\normalsize\itshape}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                                ÍNDICE                                 %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\contentsname}{ÍNDICE}

% Change style of printing chapters in TOC to match chapter headings.

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
\setcounter{secnumdepth}{3}%
\setcounter{tocdepth}{2} %   
    \addpenalty{-\@highpenalty}%
    \vskip .1cm \@plus \p@ %{the v-distance between the headings in the contents}
    \setlength\@tempdima{1.5em}% %{the distance between the number of the chapter and its title}
    \begingroup
      \parindent\z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance \leftskip \@tempdima 
      \hskip  -\leftskip 
      \etchapterheadstyle{#1}\nobreak
% % CCW: The following 3 lines add dots to the chapter TOC listings
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

% \renewcommand\addchaptertocentry[2]{\addtocentrydefault{chapter}{}{#2}}
% Add "CHAPTER"/"APPENDIX" headings to TOC before first of each.
% If you want these words to be a bit bigger, remove "\normalsize" 
% from the definition below.  If you want the words to be bold, 
% remove "\mdseries". (CCW)


% \iftocflag
% \let\old@chapter = \@chapter
% \def\@chapter[#1]#2{\ifnum\c@chapter=\z@%
%   \addtocontents{toc}{\protect\contentsline{part}%
%       {\normalsize\etchapterheadstyle{\@chapapp}}{}}%
%   \fi%
%   \old@chapter[{#1}]{#2}}
%   \fi

% \let\oldtableofcontents = \tableofcontents
% \renewcommand{\tableofcontents}{
%   \begin{onehalfspace}
% %\normalspacing
%     \oldtableofcontents
%   \end{onehalfspace}
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                             LISTA DE TABLAS                           %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\listtablename}{LISTA DE TABLAS}

% Make the table of contents, etc.,  single spaced
%
% bph added lists of tables/figures to table of contents.
% CCW fixed bug where multipage LOT/LOF were listed in TOC with wrong
% page number.

% \let\oldlistoftables = \listoftables
% \renewcommand{\listoftables}{
%   \begin{onehalfspace}
%     % This works b/c multiple \newpage's are treated as one
%     \newpage
    
%     \let\oldcaption = \caption
%     \renewcommand{\caption}{
%       % \addtocontents{lot}{\protect\addvspace{10\p@}}%
%         \oldcaption
%     }
%     \addcontentsline{toc}{chapter}{\textbf{Lista de Tablas}}
%     \oldlistoftables 
    
%   \end{onehalfspace}
% }

\let\oldlistoftables = \listoftables
\renewcommand{\listoftables}{
    \addcontentsline{toc}{chapter}{\textbf{Lista de Tablas}}
    \oldlistoftables 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                            LISTA DE FIGURAS                           %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\listfigurename}{LISTA DE FIGURAS} 

\let\oldlistoffigures = \listoffigures
\renewcommand{\listoffigures}{
%   \begin{singlespace}
%     % This works b/c multiple \newpage's are treated as one
%     \newpage
%     \let\oldcaption = \caption
% \renewcommand{\caption}{
% %            \addtocontents{lof}{\addvspace{2cm}}
% \begin{singlespace}
%         \oldcaption
%           \end{singlespace}
% }

    \addcontentsline{toc}{chapter}{\textbf{Lista de Figuras}}
    \oldlistoffigures 
%   \end{singlespace}
}


 
% Change names of table of contents and bibliography
\renewcommand{\bibname}{REFERENCIAS}
\renewcommand\appendixname{APÉNDICE}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                       %
%                                THEOREM                                %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{corollary}{Corollary}[chapter]
\newtheorem{definition}{Definition}[chapter]
\newtheorem{remark}{Remark}[chapter]
\newtheorem{note}{Note}[chapter]
\newtheorem{example}{Example}[chapter]
\newtheorem{conjecture}{Conjecture}[chapter]

\newenvironment{proof} {\noindent{\bf Proof:} \\ \noindent}

% End of File