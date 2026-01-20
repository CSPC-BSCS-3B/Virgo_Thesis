
% This template is based on gatechthesis class - for use in preparation of Theses and Dissertations at Georgia Tech 
% revised Feb 2022

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cspcccsthesis}[2021]

% based on report class, so pass options to it
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt]{report}

% package imports - add your own in preamble to the document file with \usepackage{}
\RequirePackage{graphicx}  % for images and plots
\RequirePackage[letterpaper, bindingoffset=0.2in, left=1.5in, right=1in, top=1in, bottom=1in]{geometry}
\geometry{bindingoffset=0in}
\RequirePackage{ragged2e}
\RequirePackage{multicol} % for multicolumn environments
\RequirePackage{setspace}  % use this package to set linespacing as desired
\RequirePackage{times} % use times new roman font
\RequirePackage[explicit]{titlesec}  % title control and formatting
\RequirePackage[titles]{tocloft}  % table of contents control and formatting
\RequirePackage{ifoddpage} % logical page parity checking, used with rotating
\RequirePackage{rotating}  % for rotated, landscape images
\RequirePackage[toc,page]{appendix}  % for appendices
\RequirePackage[normalem]{ulem}  % for underlining text
\RequirePackage{url} % in case explicit URL's are needed
\RequirePackage{siunitx} % several functions related to expressing units
\RequirePackage[bookmarks=true,hidelinks]{hyperref} % should be last(ish)
\RequirePackage{bookmark} % allows reformatting of pdf bookmarks
\RequirePackage{caption} % captions for figures
\RequirePackage{subcaption} % allows subfigures in a reasonhttps://www.overleaf.com/project/618656cf1ee7da737990a3fbable way, plays nice with caption
\RequirePackage[acronym,nogroupskip,nopostdot]{glossaries} % only for list of acronyms
\RequirePackage{doi} % and this is laster, makes easier hyperlinking for doi sources
\RequirePackage{fancyhdr}
\RequirePackage{authblk}
\RequirePackage{lastpage}
\RequirePackage[style=acmnumeric,backend=biber,natbib=true,sorting=anyt]{biblatex}
\addbibresource{references.bib}
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\RequirePackage[font=bf]{caption}
\RequirePackage{indentfirst}
\RequirePackage{float}


\DeclareCaptionLabelFormat{nospace}{#1#2}
\captionsetup[table]{labelfont=normalfont,name=Table,labelsep=newline}

\captionsetup[figure]{labelfont=normalfont,name=Figure}

\geometry{
  letterpaper,
  left=1.5in,
  right=1in,
  headheight=0.8in,
  top=1.5in,
  bottom=0.7in,
  footskip=0.3in
}
\setcounter{secnumdepth}{0}
\renewcommand{\headrulewidth}{1.5pt}% 2pt header rule

\setlength{\headsep}{0.5in}

\sisetup{
    sticky-per=true,
    detect-mode=true,
    per-mode = symbol-or-fraction
}

\fancypagestyle{plain}{%
    \fancyhf{}%
    \lhead{\includegraphics[width=4.5cm]{settings/CSPC-WEBSITEV2_3.png}  \\}
    \rhead{\includegraphics[width=4.5cm]{settings/Proposed Logo - College of Computer Studies (CSPC)-07.png} \\ }
    \cfoot{}
}

\doublespacing  % set line spacing
\AtBeginDocument{\renewcommand{\ref}[1]{\autoref{#1}}} % for concision, but can be removed if you know what you're doing
\makeglossaries % process glossaries
\urlstyle{same} % uses the text font, not a monospace one, for URLs
\hbadness=9000 % suppress some hbox warnings

% hyperlink coloring, or lack thereof
\hypersetup{
    colorlinks,
    linkcolor={black},
    citecolor={black}, 
    urlcolor={black}
}
\setlength{\headheight}{30pt}

\makeatletter

% formatting of chapter numbers in bookmarks
\bookmarksetup{%
    depth=1, % bookmark depth - 1 goes to section depth, 2 to subsection, etc.
    addtohook={%
    \ifnum 0=\bookmarkget{level}\relax
      \renewcommand*{\numberline}[1]{#1 | }%
    \fi
    \ifnum 0<\bookmarkget{level}\relax
      \renewcommand*{\numberline}[1]{}%
    \fi
    }
}

% so that using ref with algorithms works correctly
\newcommand{\ALC@uniqueautorefname}{Line}
\newcommand{\algorithmautorefname}{Algorithm}

% set up rotatepage environment - this will make landscape figures with awareness of page parity and whether the document is set up as single- or two-sided
\@ifclasswith{report}{twoside}{%
    \newenvironment{rotatepage}{%
        \checkoddpage\ifoddpage
            \clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 270}%
        \else
            \clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 90}%
        \fi
        }%
        {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 0}}%
    }{
    \newenvironment{rotatepage}%
        {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 90}}%
        {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 0}}%
    }

% tokens for author info\
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\thesisAbstract}[1]{\gdef\@thesisAbstract{#1}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\dean}[1]{\gdef\@dean{#1}}
\newcommand{\authorOne}[1]{\gdef\@authorOne{#1}}
\newcommand{\authorTwo}[1]{\gdef\@authorTwo{#1}}
\newcommand{\authorThree}[1]{\gdef\@authorThree{#1}}
\newcommand{\committeeMemberOne}[1]{\gdef\@committeeMemberOne{#1}}
\newcommand{\committeeMemberTwo}[1]{\gdef\@committeeMemberTwo{#1}}
\newcommand{\committeeChair}[1]{\gdef\@committeeChair{#1}}
\newcommand{\adviser}[1]{\gdef\@adviser{#1}}%
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}%
\newcommand{\@approvaldate}{\@latex@warning@no@line{No \noexpand\approvaldate given}}
\newcommand{\school}[1]{\gdef\@school{#1}}%
\newcommand{\@school}{\@latex@warning@no@line{No \noexpand\school given}}
\newcommand{\department}[1]{\gdef\@department{#1}}%
\newcommand{\@department}{\@latex@warning@no@line{No \noexpand\department given}}
\newcommand\titlefontsize{\fontsize{17pt}{17pt}\selectfont}
\newcommand{\bibliofont}{\footnotesize}
\makeatother

% frontmatter environment, only handles title formatting
\newenvironment{frontmatter}{%
    \pagestyle{fancy}
    % \fancyhf{}
    % \fancyfoot{}
    % \lhead{\includegraphics[width=4cm]{settings/CSPC-WEBSITEV2_3.png} \\ }
    % \rhead{\includegraphics[width=4cm]{settings/Proposed Logo - College of Computer Studies (CSPC)-07.png} \\ \thepage}
    \titleformat{\chapter}[display]{\normalfont\bfseries\filcenter}{\chaptertitlename\ \thechapter}{0pt}{\MakeUppercase{##1}}
}%
{%
    \clearpage
}

% thesisbody environment, handles text and other formatting

\newenvironment{thesisbody}{%
    \pagestyle{fancy}
    \fancyhf{}
    \lhead{\includegraphics[width=4.5cm]{settings/CSPC-WEBSITEV2_3.png} \\  }
    \rhead{\includegraphics[width=4.5cm]{settings/Proposed Logo - College of Computer Studies (CSPC)-07.png} \\ \thepage}
    \cfoot{}
    \renewcommand{\headrulewidth}{2pt}
    \renewcommand{\bibname}{Notes}
    \pagenumbering{arabic} % resumes page numbering after front matter
    \setcounter{page}{1} % set the page number appropriately
    \titleformat{\chapter}[display]{\normalfont\bfseries\filcenter}{\MakeUppercase\chaptertitlename\ \thechapter}{0pt}{\MakeUppercase{##1}}  % spacing between titles
    \titlespacing*{\chapter}
      {0pt}{0pt}{30pt}	% controls vertical margins on title
    \titleformat{\section}{\normalfont\bfseries}{\thesection}{1em}{##1}
    \titleformat{\subsection}{\normalfont\bfseries\itshape}{\thesubsection}{0em}{##1}
    \titleformat{\subsubsection}{\normalfont\itshape}{\thesubsection}{1em}{##1}
}%
{
    \clearpage
}

% ------------------ Title Page ------------------
\makeatletter
% args: {month}{year}
\newcommand{\makeTitlePage}[2]{
    
    \pagestyle{fancy}
    \fancyhf{}
    \lhead{\includegraphics[width=4.5cm]{settings/CSPC-WEBSITEV2_3.png} \\ }
    \rhead{\includegraphics[width=4.5cm]{settings/Proposed Logo - College of Computer Studies (CSPC)-07.png} \\ }
    \cfoot{\thepage}
    
    \pagenumbering{gobble}
    \currentpdfbookmark{Title Page}{titlePage}
    \phantomsection
    \begin{center}
    \begin{singlespacing}
    \vspace{10\baselineskip}
    \titlefontsize\textbf{\\\MakeUppercase{Beyond LLMs: A RAG Chatbot for Efficient Literature Search and Thesis \\Retrieval in CSPC Library}}\\
    \normalsize
    \vspace{10\baselineskip}
    A Thesis Project\\
    presented to the Faculty of\\
    % \@department\\
    \@school\\
    \vspace{4\baselineskip}
    In Partial Fulfillment of the Requirements\\
    for the degree \@degree\\ 
    \vspace{4\baselineskip}
    By\\
    \@authorOne\\ 
    \@authorTwo\\ 
    \@authorThree\\
    \vfill
    \ #1 \ #2
    \end{singlespacing}
    \end{center}
}

% ------------------ approval page environment/formatting ------------------

% If for whatever reason your approval page looks odd, comment out the lines below and use the page from the old template. But this approach *should* work.
% the following lines are solely a trick to make the approval page multicolumn environment work right (thanks LaTeX stackexchange contributors)
\let\multicolmulticols\multicols
\let\endmulticolmulticols\endmulticols
\RenewDocumentEnvironment{multicols}{mO{}}
 {%
  \ifnum#1=1
    #2%
  \else % More than 1 column
    \multicolmulticols{#1}[#2]
  \fi
 }
 {%
  \ifnum#1=1
  \else % More than 1 column
    \endmulticolmulticols
  \fi
 }
 % ------ end little trick ------

\newenvironment{approvalPage}[1]%
{%
\clearpage
\thispagestyle{fancy}
\fancyhf{}
\lhead{\includegraphics[width=4.5cm]{settings/CSPC-WEBSITEV2_3.png} \\ }
\rhead{\includegraphics[width=4.5cm]{settings/Proposed Logo - College of Computer Studies (CSPC)-07.png} \\}
\cfoot{\thepage}
\cfoot{\thepage}
\columnsep=30pt
\pagenumbering{roman}
\addcontentsline{toc}{chapter}{Approval Page}
\begin{center}
\textbf{\MakeUppercase{\\Approval Page}}\\
\end{center}

\centering
    \begin{figure}[H]
        \centering
        \includegraphics[width=1\textwidth]{appendices/approvalp.jpg}
    \end{figure}

% In partial fulfillment of the requirements for the degree of \@degree, this research entitled \textbf{\MakeUppercase{\@title}} prepared and submitted by \textbf{\@authorOne}, \textbf{\@authorTwo}, \textbf{\@authorThree} has been examined and is recommended for approval and acceptance.\\

%     \center{\textbf{\underline{\MakeUppercase{\@adviser}}}\\Adviser}\\
%     \vspace{\baselineskip}
%     % \hline \\ 
%     \vspace{\baselineskip}
    
%     \indent This research project entitled, \textbf{\MakeUppercase{\@title}} in partial fulfillment of the requirements for the degree of \@degree\ has been examined and is recommended for acceptance and approval for ORAL EXAMINATION.
    
%     \vspace{\baselineskip}
    
%     \center{\textbf{\MakeUppercase{RESEARCH COMMITTEE:}}} \\
%     \vspace{\baselineskip}
%     \begin{multicols}{2}
%     \textbf{\underline{\MakeUppercase{\@committeeMemberOne}}}\\
%     Member\\
%     \columnbreak
%     \textbf{\underline{\MakeUppercase{\@committeeMemberTwo}}}\\
%     Member\\
%     \end{multicols}
%     \textbf{\underline{\MakeUppercase{\@committeeChair}}}\\
%     Chairman
}

% ------------------ Panel Of Examiners ------------------
\newcommand{\makePanelofExaminers}[1]{
\clearpage
\addcontentsline{toc}{chapter}{Panel of Examiners}
\vspace{\baselineskip}
\begin{center}
\textbf{\MakeUppercase{\\Panel of Examiners}} \\
\end{center}
        \textbf{APPROVED} by the Committee on Oral Examination with a grade of \textbf{PASSED} on \\
\@approvaldate.

\begin{center}
    \vspace{\baselineskip}
    \textbf{\underline{\MakeUppercase{\@committeeChair}}}\\
    Chairman \\
    \begin{multicols}{2}
    \textbf{\underline{\MakeUppercase{\@committeeMemberOne}}}\\
    Member\\
    \columnbreak
    \textbf{\underline{\MakeUppercase{\@committeeMemberTwo}}}\\
    Member\\
    \end{multicols}
    
    \vspace{\baselineskip}

%\hline
\end{center}
\vspace{\baselineskip}

\textbf{ACCEPTED} and \textbf{APPROVED} in partial fulfillment of the requirements in \@degree\ with a grade of \underline{\hspace{1cm}}.
\begin{center}
    \vspace{\baselineskip}
    \textbf{\underline{\MakeUppercase{\@dean}}}\\
    OIC Dean, \@school \\
    Date: \underline{\hspace{5cm}}
    
\end{center}
}

% ------------------ Epigraph ------------------
% \newcommand{\makeEpigraph}[2]{
% \clearpage
% \begin{center}
% \vspace*{\fill}
% #1\\
% \textit{#2}
% \vspace*{\fill}
% \end{center}
% }

% ------------------ Dedication ------------------
\newcommand{\makeDedication}[1]{
\clearpage
\addcontentsline{toc}{chapter}{Dedication}
\begin{center}
\textbf{\MakeUppercase{\\Dedication}} \\
\vspace*{\fill}
#1\\
\vspace*{\fill}
\end{center}
}

% ------------------ Acknowledgments environment/formatting ------------------
\newenvironment{acknowledgments}
{
    \clearpage
    \addcontentsline{toc}{chapter}{Acknowledgments}
    \begin{centering}
    \textbf{\\ACKNOWLEDGMENTS}\\
    \vspace{\baselineskip}
    \end{centering}
}

% ------------------ Abstract ------------------
\newcommand{\makeAbstract}{
\clearpage
\addcontentsline{toc}{chapter}{Abstract}
% \nospacing
\begin{center}
\textbf{\\ABSTRACT}\\
\end{center}
\begin{singlespacing}
\begin{multicols}{2}
\textbf{Title:}\\
\columnbreak
\\ \@title\\
\end{multicols} 

\begin{multicols}{2}
\textbf{Authors:}\\
\columnbreak
\\ \@authorOne\\ 
\@authorTwo\\ 
\@authorThree\\
\end{multicols} 

\begin{multicols}{2}
\textbf{Number of Pages:}\\
\columnbreak
\\ \pageref{LastPage}\\
\end{multicols} 

\begin{multicols}{2}
\textbf{School:}\\
\columnbreak
\\ Camarines Sur Polytechnic Colleges\\
\end{multicols} 

\begin{multicols}{2}
\textbf{Degree Conferred:}\\
\columnbreak
\\ \@degree \\
\end{multicols} 

\begin{multicols}{2}
\textbf{Keywords:}\\
\columnbreak
\\ \@keywords \\
\end{multicols} 

\@thesisAbstract

\end{singlespacing}
}

{
    \clearpage
}

% --------------- table of contents formatting and command creation ---------------
\renewcommand{\cftchapdotsep}{\cftdotsep}  % add dot separators
\renewcommand{\cftchapfont}{\bfseries}  % set title font weight
\renewcommand{\cftchappagefont}{}  % set page number font weight
\renewcommand{\cftchappresnum}{Chapter }
\renewcommand{\cftchapaftersnum}{:}
\renewcommand{\cftchapnumwidth}{5em}
% \renewcommand{\cftchapafterpnum}{\vskip\baselineskip} % set correct spacing for entries in single space environment
% \renewcommand{\cftsecafterpnum}{\vskip\baselineskip}  % set correct spacing for entries in single space environment
% \renewcommand{\cftsubsecafterpnum}{\vskip\baselineskip} % set correct spacing for entries in single space environment
% \renewcommand{\cftsubsubsecafterpnum}{\vskip\baselineskip} % set correct spacing for entries in single space environment
\newcommand{\makeTOC}{
    % format title font size and position (this also applies to list of figures and list of tables)
    \let\origaddvspace\addvspace
    \renewcommand{\addvspace}[1]{}
    \titlespacing*{\chapter}{0pt}{20pt}{10pt}
    \begin{singlespace}
    \currentpdfbookmark{Table of Contents}{TOC}
    \renewcommand\contentsname{Table of Contents}
    \tableofcontents
    \end{singlespace}
    \clearpage
}

% ------------------ List of Tables ------------------
\newcommand{\makeListOfTables}{
\phantomsection
\addcontentsline{toc}{chapter}{List of Tables}
\begin{singlespace}
% \setlength\cftbeforetabskip{1}  % manually set spacing between entries
\thispagestyle{fancy}
\let\oldnumberline\numberline%
\renewcommand{\numberline}{\tablename~\oldnumberline}%
\singlespacing
\listoftables
\end{singlespace}
\clearpage
}

% ------------------ List of Figures ------------------
\newcommand{\makeListOfFigures}{
\phantomsection
\addcontentsline{toc}{chapter}{List of Figures}
\begin{singlespace}
% \setlength\cftbeforefigskip{0}  % manually set spacing between entries
\thispagestyle{fancy}
\let\oldnumberline\numberline%
\renewcommand{\numberline}{\figurename~\oldnumberline}%
\singlespacing
\listoffigures
\end{singlespace}
\clearpage
}

% ------------------ List of Acronyms ------------------
\newcommand{\makeListOfAcronyms}{
\phantomsection
\singlespacing
\addcontentsline{toc}{chapter}{List of Acronyms}
\printacronyms[nonumberlist,title={List of Acronyms}]
\clearpage
\doublespacing
}

% ------------------ summary environment definition ------------------
\newenvironment{summary}{
    \clearpage
    \begin{centering}
    \textbf{SUMMARY}\\
    \vspace{\baselineskip}
    \end{centering}
}{
}

% ------------------ appendix environment definition ------------------
% A note on layout: in the Chicago (and by extension IEEE) style manual, appendices are first in the end matter, then bibliography or references. In APA, bibliography is first, then appendices. The thesis manual on which this template is based assumes the Chicago convention.

% remove the page number on the appendices cover and move bookmark up the page, create a group-subgroup structure for the appendices in the TOC/bookmarks
\makeatletter
\newenvironment{theappendices}{
    \thispagestyle{plain}
    \bookmarksetup{depth=0,open}
    % \addtocontents{toc}
    {\setcounter{tocdepth}{1}}
    \renewcommand{\@chap@pppage}{%
        \clear@ppage
        \addappheadtotoc
        \thispagestyle{plain}
        \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
        \null\vfil
        \markboth{}{}%
        {\centering
        \interlinepenalty \@M
        \normalfont
        \bfseries \MakeUppercase{\appendixpagename}\par}%
        \if@dotoc@pp
        \fi
    }
    % \bookmarksetupnext{level=part}
    \begin{appendices}
    \thispagestyle{fancy}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecpresnum}{\appendixname\space}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecnumwidth}{5.75em}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecaftersnum}{:}}
    \addtocontents{toc}{%
    \begingroup
        \let\protect\l@chapter\protect\l@section
        \let\protect\l@section\protect\l@subsection
    }
}{
    \addtocontents{toc}{\endgroup}
    \clearpage
    \end{appendices}
}
\makeatother

% ------------------ bibliography formatting and command creation ------------------

% I am only leaving these \AtEveryBibitem lines in because they were in the original template when I downloaded it. Change these at your own leisure.

% prevent certain fields in references from printing in bibliography


\newcommand{\makeBibliography}{
    \clearpage
    \renewcommand{\bibname}{Bibliography}
    \defbibenvironment{mypubs}
        {\list
            {}
            {\setlength{\leftmargin}{\bibhang}%
            \setlength{\itemindent}{-\leftmargin}%
            \setlength{\itemsep}{\bibitemsep}%
            \setlength{\parsep}{\bibparsep}}}
        {\endlist}
        {\item}

    
    %\bookmarksetupnext{level=part}
    \phantomsection
    \addcontentsline{toc}{chapter}{Bibliography}
    \begin{singlespace}  % use single-line spacing for multi-line text within a single reference
    
    \printbibheading
    \nocite{*}
    \printbibliography[env=mypubs,type=book,heading=subbibliography,title={Book Sources}]
    \printbibliography[env=mypubs,type=article,heading=subbibliography,title={Journal Articles}]
    \printbibliography[env=mypubs,type=proceedings,heading=subbibliography,title={Proceedings}]
    \printbibliography[env=mypubs,type=online,heading=subbibliography,title={Online Sources}]
    \printbibliography[env=mypubs,type=unpublished,heading=subbibliography,title={Thesis}]
    \printbibliography[env=mypubs,nottype=book,nottype=unpublished,nottype=proceedings,nottype=article, nottype=online, heading=subbibliography,title={Other Sources}]
    \end{singlespace}
}

% ------------------ vita environment ------------------
\newenvironment{vita}{
    \bookmarksetupnext{level=part}
    \thispagestyle{fancy}
    \chapter*{Vita}
    \addcontentsline{toc}{chapter}{Vita}
}{
}