% primus.cls for LaTeX2e
% Version 24-May-2010.
% Fixed caption formatting to apply to multiple lines of text.

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{primus}[2008/04/02]

% Bring in the regular article class
\LoadClass[twoside]{article}

% Set the page dimensions
\setlength{\textheight}{7.16in}
\advance\textheight by \topskip
\setlength{\textwidth}{4.32in}
\setlength{\oddsidemargin}{1.09in}
\setlength{\evensidemargin}{1.09in}
\setlength{\topmargin}{0.56in}
\setlength{\headsep}{0.24in}


% Do the page numbers in boldface
\renewcommand{\thepage}{\bf\arabic{page}}

% Here is the information supplied in the header which is not
% part of the normal LaTeX topmatter.
\newcommand{\keywords}[1]{\renewcommand{\key@words}{#1}}
\newcommand{\key@words}{\null}

% Change the myheadings option to boldface.
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\bfseries\leftmark}%
    \def\@oddhead{{\bfseries\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
    

% Make the title page
\newcommand{\makePtitlepage}{
\setcounter{page}{0}
\thispagestyle{empty}
  \null\vfil
  \begin{center}%
    {\LARGE\bfseries \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}\par
  \vskip 1.0in
   \vfil\null\eject
}

% Repeat the title on page 1.
\newcommand{\makePtitle}{
\thispagestyle{empty}
{\null}\vskip 0.75in
\begin{center}
{\Large\bfseries \@title \par}
\end{center}
\bigskip
}

% Redefine the abstract environment.
\renewenvironment{abstract}{%
\noindent\small
{\normalsize\bfseries Abstract:}
} 

% List the keywords.
\newcommand{\listkeywords}{
\bigskip
{\noindent
{\small\bfseries Keywords:} \key@words}
\vskip 0.3in
}

% Make the section and subsection fonts smaller.
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
                                     
 % Reduce \belowcaptionskip.
 \setlength\belowcaptionskip{5pt}
                                                                       
% Modify the "Figure X" font in figure captions.
\renewcommand{\@makecaption}[2]{
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small {\bfseries #1.} #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\small {\bfseries #1.} #2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
  
% Set the \footnoterule width to zero.
\renewcommand\footnoterule{%
  \kern0\p@
  \hrule\@width0\p@
  \kern0\p@}
  
% Make "REFERENCES" in all caps.
\renewcommand\refname{REFERENCES}

% Always want author on left and title on right.
\pagestyle{myheadings}

% Re-format quotes and quotations
\renewenvironment{quotation}{\begin{list}{}{\leftmargin=15pt%
\rightmargin=15pt%
\listparindent=0pt}\item\relax}%
{\end{list}}
\renewenvironment{quote}{\begin{list}{}{\leftmargin=15pt%
\rightmargin=15pt%
\listparindent=0pt}\item\relax}%
{\end{list}}

%%%  tweaklist.sty  %%%
\def\enumhook{}
\def\enumhooki{}
\def\enumhookii{}
\def\enumhookiii{}
\def\enumhookiv{}
\def\itemhook{}
\def\itemhooki{}
\def\itemhookii{}
\def\itemhookiii{}
\def\itemhookiv{}
\def\descripthook{}
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
          \enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}%
  \fi}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
        \itemhook \csname itemhook\romannumeral\the\@itemdepth\endcsname}%
  \fi}
\renewenvironment{description}
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                          \let\makelabel\descriptionlabel\descripthook}}
                 {\endlist}
                 
% Use code from tweaklist.sty
% to reduce \itemsep
\renewcommand{\enumhook}
{
\setlength{\parsep}{0pt}
\setlength{\itemsep}{2pt}
\setlength{\listparindent}{1.5em}
\setlength{\leftmargin}{2em}
}
%
\renewcommand{\itemhook}
{
\setlength{\parsep}{0pt}
\setlength{\itemsep}{2pt}
\setlength{\listparindent}{1.5em}
\setlength{\leftmargin}{2em}
}
%
\renewcommand{\descripthook}
{
\setlength{\parsep}{0pt}
\setlength{\itemsep}{2pt}
\setlength{\listparindent}{1.5em}
\setlength{\leftmargin}{2em}
}


