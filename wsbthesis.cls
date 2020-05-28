\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wsbthesis}[2019/11/02 WSB thesis style class]

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions\relax

% Set document geometry
\LoadClass[12pt]{report}
\RequirePackage[
	a4paper,
	twoside,
	top=2.5cm,
	bottom=2.5cm,
	outer=2.5cm,
	inner=3.5cm,
]{geometry}

% Set indent settings
\RequirePackage{indentfirst}
\setlength\parindent{1.25cm}

% Set interline to 1.5
\renewcommand{\baselinestretch}{1.5}

% Move page number to the right side – Source: https://tex.stackexchange.com/a/8847
\RequirePackage{fancyhdr}
\fancyhf{} % clear all header and footers
\renewcommand{\headrulewidth}{0pt} % remove the header rule
\rfoot{\thepage}

% Make it work for titlepage and chapter beginnings – Source: https://tex.stackexchange.com/a/153176
\fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0pt}%
    \fancyhf{}%
    \fancyfoot[R]{\thepage}%
}

% Set TOC style
% \RequirePackage{tocloft}
% \RequirePackage{calc}

% Force dots in TOC – Source: https://tex.stackexchange.com/a/53901
% \renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Add "Rozdział" before chapter name – Source https://tex.stackexchange.com/a/3401
% \renewcommand{\cftchappresnum}{\chaptername\space}
% \setlength{\cftchapnumwidth}{\widthof{\textbf{Chapter 9}}}
% \makeatletter
% \g@addto@macro\appendix{%
%   \addtocontents{toc}{%
%     \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
%   }%
% }

% Set main font
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{TeX Gyre Termes}
% \setmonofont{TeX Gyre Cursor}
% \setmainfont[Ligatures=TeX]{Times New Roman}

% Format URL as sans
\RequirePackage{hyperref}
\renewcommand\UrlFont{\rmfamily}

% Set listings font
\RequirePackage{listings}
\lstset{basicstyle=\footnotesize\fontspec{Cascadia Code}}

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
	\clearpage
	\hypertarget{toc}{} % set the hypertarget
	\bookmark[dest=toc,level=chapter]{\contentsname} % add the bookmark
	\tableofcontents
	\thispagestyle{empty}\pagestyle{fancy}
	\newpage
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
			\wsb@supervisor
		}
		\vspace{2.5cm}

		\begin{center}
			Gdynia \wsb@wyear
		\end{center}
	}
	\thispagestyle{empty}
}

\makeatother

% LocalWords:  albumnumber wyear pbox setspace wsb DefineClassCommand calc
