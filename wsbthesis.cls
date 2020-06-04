\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wsbthesis}[2020/06/04 WSB thesis style class]

\RequirePackage{etoolbox}

\makeatletter

\newcommand*{\OptionSwitch}[1]{%
  \newtoggle{#1}
  \DeclareOption{#1}{\toggletrue{#1}}
}

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{report}}

\OptionSwitch{tocchapter}
\OptionSwitch{tocchapterdots}
\OptionSwitch{sectionnumberdot}

\ProcessOptions\relax

% Set document geometry
\LoadClass[12pt]{report}
\RequirePackage[
  a4paper,
  twoside,
  top    = 2.5cm,
  bottom = 2.5cm,
  outer  = 2.5cm,
  inner  = 3.5cm,
]{geometry}

% Set indent settings
\RequirePackage{indentfirst}
\setlength\parindent{1.25cm}

% Set interline to 1.5
\renewcommand{\baselinestretch}{1.5}

% Move page number to the right side
% Sources:
% https://tex.stackexchange.com/a/8847 and https://tex.stackexchange.com/a/153176
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhf{}%
  \fancyfoot[R]{\thepage}%
}
\pagestyle{plain}

\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\LARGE\bfseries}

% Add "Rozdział" before chapter name – Source https://tex.stackexchange.com/a/3401
\iftoggle{tocchapter}{%
  \RequirePackage{calc}
  \renewcommand{\cftchappresnum}{\chaptername\space}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{Chapter 99}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
    }%
  }
}

% Force dots in TOC – Source: https://tex.stackexchange.com/a/53901
\iftoggle{tocchapterdots}{%
  \renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftdotsep}}
  \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
}{}

% Add dot after chapter/section number
\iftoggle{sectionnumberdot}{%
  \renewcommand{\thechapter}{\arabic{chapter}.}
  \renewcommand{\thesection}{\thechapter\arabic{section}.}
  \renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
}


% Set main font
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{TeX Gyre Termes}

% Format URL as sans
\RequirePackage{hyperref}
\renewcommand\UrlFont{\rmfamily}

% Format chapter and section title – Source: https://tex.stackexchange.com/a/1477/175096
\RequirePackage[compact]{titlesec}
\titleformat{\chapter}
  {\fontsize{14}{16}\selectfont\bfseries}
  {\chaptertitlename\ \thechapter}{10pt}{\fontsize{14}{16}\selectfont}
\titleformat{\section}
  {\fontsize{13}{15}\selectfont\bfseries}
  {\thesection}{10pt}{\fontsize{13}{15}\selectfont}
\titleformat{\subsection}
  {\fontsize{13}{15}\selectfont\bfseries}
  {\thesubsection}{10pt}{\fontsize{13}{15}\selectfont}


% Define class commands
\def\wsb@DefineClassCommand#1{%
  \expandafter\def\csname#1\endcsname##1{%
    \expandafter\def\csname wsb@#1\endcsname{##1}%
  }%
  \expandafter\def\csname wsb@#1\endcsname{}%
}
\wsb@DefineClassCommand{university}
\wsb@DefineClassCommand{faculty}
\wsb@DefineClassCommand{degree}
\wsb@DefineClassCommand{albumnumber}
\wsb@DefineClassCommand{supervisor}
\wsb@DefineClassCommand{wyear}


\def\printtableofcontent{%
  \clearpage%
  \hypertarget{toc}{} % set the hypertarget
  \bookmark[dest=toc,level=chapter]{\contentsname} % add the bookmark
  \tableofcontents%
  \thispagestyle{empty}
  \newpage%
}

% A modified \chapter command
\newcommand*{\@introductiontitlename}{Wstęp}
\newcommand*{\@makeintroductionhead}{%
  \vspace*{50\p@}
  {%
    \parindent\z@%
    \raggedright\normalfont%
    \interlinepenalty\@M%
    \fontsize{14}{16}\selectfont\bfseries \@introductiontitlename\par%
    \nobreak{}
    \vskip40\p@%
  }
}
\newcommand*{\@introduction}{%
  \addcontentsline{toc}{chapter}{\@introductiontitlename}
  \if@twocolumn%
    \@topnewpage [\@makeintroductionhead]
  \else
    \@makeintroductionhead\@afterheading%
  \fi
}
\newenvironment{introduction}{%
  \if@openright%
    \cleardoublepage%
  \else
    \clearpage%
  \fi
  \pagestyle{empty}\global\@topnum\z@ \@afterindentfalse%
  \@introduction%
}{%
  \clearpage\pagestyle{fancy}
}

% Provides \thetitle, \theauthor etc.
\RequirePackage{titling}

% Automatic \parbox
\RequirePackage{pbox}

% Provides \setstretch command
\RequirePackage{setspace}

\renewcommand{\maketitle}{%
  {\setstretch{1.0}%
   \vspace*{0.3cm}
   \begin{center}
     \fontsize{16}{18}\selectfont\addfontfeatures{LetterSpace=10}%
     \MakeUppercase{\wsb@university} \\
     \fontsize{14}{18}\selectfont%
     \MakeUppercase{\wsb@faculty}
   \end{center}
   \vspace{3.5cm}

   \begin{center}
     {\fontsize{14}{16}\selectfont%
      \@author \\
      \fontsize{12}{14}\selectfont%
      nr albumu \wsb@albumnumber}
   \end{center}
   \vspace{1.2cm}

   \begin{center}
     {\fontsize{20}{24}\selectfont\addfontfeatures{LetterSpace=5}%
      \textbf{\MakeUppercase{\@title}}\par}
   \end{center}
   \vspace{1.2cm}

   \begin{center}
     {\fontsize{14}{20}\selectfont%
       Praca inżynierska \\
       na kierunku \wsb@degree}
    \end{center}
    \vspace{2.5cm}

    \hspace*{0.5\textwidth}
    \pbox{\textwidth}{\setstretch{1.5}%
      Praca napisana pod kierunkiem \\
      \wsb@supervisor%
    }
    \vspace{2.5cm}

    \begin{center}
      Gdynia \wsb@wyear
    \end{center}}
  \thispagestyle{empty}
  \setcounter{page}{0}
}

\undef{\OptionSwitch}

\makeatother

% Local Variables:
% indent-tabs-mode: nil
% tab-width: 2
% End:
