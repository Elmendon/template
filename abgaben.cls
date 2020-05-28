\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abgaben}[v. 1.3]
\LoadClass[10pt,numbers = noendperiod]{scrartcl}

%
%Packages
%

%Prüfen welcher compiler verwendet wird, sollte die verwendung von XeTeX/LuaTeX ermöglichen
\RequirePackage{ifxetex,ifluatex}
\ifluatex
	\RequirePackage{polyglossia} 
	\setmainlanguage{german}
	\setotherlanguage{english}
\else
	\ifxetex
		\RequirePackage{polyglossia}
		\setmainlanguage{german}
		\setotherlanguage{english}
	\else
		\RequirePackage[T1]{fontenc}
		\RequirePackage[utf8]{inputenc}
		\RequirePackage[ngerman,english]{babel}
	\fi
\fi

\RequirePackage{lmodern} 
\RequirePackage{amsmath} 
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[width=18.00cm, height=25.00cm, head=25pt, top=2.5cm]{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage[headsepline]{scrlayer-scrpage}
\RequirePackage[framemethod=TikZ,nobreak=true]{mdframed}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{adjustbox}
\RequirePackage{tabularx}
\RequirePackage{todonotes}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage{environ}
\RequirePackage[24hr]{datetime}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{array}
\RequirePackage[normalem]{ulem}

%
%Customization
%

%Redifine Section counter
\renewcommand\thesection{Aufgabe \exercisenumber.\arabic{section}}
\renewcommand\thesubsection{\arabic{subsection})}
\renewcommand\thesubsubsection{(\alph{subsubsection})}

%Header Commands
\newcommand{\settopic}[1]{\newcommand{\topic}{#1}}
\newcommand{\setgroupmember}[1]{\newcommand{\groupmember}{}}
\newcommand{\setgroupnumber}[1]{\newcommand{\group}{}}
\newcommand{\setexercisenumber}[1]{\newcommand{\exercisenumber}{#1}}

%Define new Taskcommand 
\newcounter{taskCounter}
\defcounter{taskCounter}{1}
\newcommand{\task}[3]{
	\par\noindent
	\normalfont\large
	\textbf{#1}
	\ifthenelse{\equal{#2}{}}{Empty.}{[#2]}
	\hfill 
	\textbf{Punkte \uline{\hspace{1em}}/#3} \par\noindent
}

\newcommand{\Task}[2]{
	\task{Aufgabe \exercisenumber.\arabic{taskCounter}\stepcounter{taskCounter}}{#1}{#2}
}


%Set todo to inline mode
\presetkeys{todonotes}{inline}{}

%
%Commands
%

%Abgabenspezifische Commands
\newcommand{\added}[1]{\textcolor{red}{#1}}
\newcommand{\AlgHinweise}{
\begin{mdframed}[frametitlebackgroundcolor=lightgray!80, backgroundcolor=lightgray!30, roundcorner=2pt, frametitle=Hinweise zur Abgabe, frametitlerule=true]
	\begin{itemize}
		\item Bei mehrfachen Abgaben des gleichen Blattes, immer die letzte abgegebene Version werten!
	\end{itemize}
\end{mdframed}	
}


\newmdenv[linecolor=black!30,
	frametitle=Punkte,
	roundcorner=2pt,
]{points}
\newcommand{\Punkte}{
	\begin{points}
			\begin{center}
				\begin{tabular}[ht]{|l|c|c|c|c|c|c|c|c|c|c|c|c|c|}
					\hline
					\multirow{2}{*}{Block} & \multicolumn{7}{c}{Block 1} & \multicolumn{6}{|c|}{Block 2} \\ \cline{2-14}
					& \multicolumn{7}{c}{$100.5/100$} & \multicolumn{6}{|c|}{$67.5/90$} \\ 
					\hline
					\multirow{2}{*}{Blatt} & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 \\ \cline{2-14}
					
					&  $13.5$ & $19.5$  & $25$ & $20.5$ & $23$ & $0$ & $0$ & $22.5$ &  $24.5$ & $20.5$ &  &  &  \\
					\hline
				\end{tabular}
			\end{center}
			\begin{center}
				\begin{tabular}[ht]{|c|c|c|c|c|}
					\hline
					Aufgabe & 1 & 2 & 3 & $\sum$ \\ \hline
					Punkte  &   &   &   &        \\ \hline
				\end{tabular}
			\end{center}
	\end{points}
}


%
%Environments
%

\mdfdefinestyle{enviStyle}{
	linewidth=1pt,
	frametitlerule=true,
	roundcorner=2pt}

%Umgebung für Kommentare vom Tutor
\newcommand{\commentSpaceX}[1]{\begin{commentSpace}\vspace{#1 cm}\end{commentSpace}}
\newmdenv[linecolor=orange,
	frametitle=Kommentare,
	frametitlebackgroundcolor=orange!70,
	style=enviStyle
	]{commentSpace}

%Umgebung für Definitionen
\newmdenv[linecolor=gray,
	frametitle=Definition,
	frametitlebackgroundcolor=gray!50,
	style=enviStyle
	]{definition}

%Umgebung für Lösungen
%\newmdenv[linecolor=red,
%	frametitle=Lösung,
%	frametitlebackgroundcolor=red!70,
%	style=enviStyle
%	]{solution}

%Umgebung für Fragen
\newmdenv[linecolor=green,
	frametitle=Frage,
	frametitlebackgroundcolor=green!50,
	style=enviStyle
	]{question}

%Umgebung für Anmerkungen
\newmdenv[linecolor=blue,
	frametitle=Info,
	frametitlebackgroundcolor=blue!50,
	style=enviStyle
	]{info}

%Umgebung für Lösungen 
\newmdenv[linecolor=black,
	frametitle=Lösung:,
	linewidth=3pt,
	topline = false, 
	rightline = false,
	bottomline = false,
	nobreak = false
	]{probSolBox}
	
\newenvironment{solution}[1][]
{
	\hfill \par 
	\begin{probSolBox}
		\begin{addmargin}[1em]{0cm}	
}
{
		\end{addmargin}
	\end{probSolBox}
	\commentSpaceX{3}
	\hfill
	%\newpage
}

%
%Class Options
%
%Option für die Abgabe
\DeclareOption{Abgabe}{
	\RenewEnviron{question}[1]{}
	\RenewEnviron{info}[1]{}
	%\RenewEnviron{solution}[1]{}
	\presetkeys{todonotes}{disable}{}
	\renewcommand{\setgroupmember}[1]{\newcommand{\groupmember}{#1}}
	\renewcommand{\setgroupnumber}[1]{\newcommand{\group}{Gruppe #1}}
}

%Option für die Weitergabe
\DeclareOption{Weitergabe}{
	\RenewEnviron{question}[1]{}
	\RenewEnviron{info}[1]{}
	\RenewEnviron{solution}[1]{}
	\presetkeys{todonotes}{disable}{}
}

%Header Styles
\renewcommand{\headfont}{\normalfont}
\clearpairofpagestyles
\DeclareOption{DoubleHeader}{
	%Header Options
	\ihead{\textbf{\topic} \\ \footnotesize \groupmember}
	\chead{\raisebox{\baselineskip}{\textbf{\group}}}
	\ohead{\raisebox{\baselineskip}{\textbf{Übungsblatt \exercisenumber}}}
	
	%Footer Options
	\ifoot{\footnotesize  \thesection}
	\cfoot{\footnotesize Version vom \today{} um \currenttime{} Uhr}
	\ofoot{\footnotesize Seite \thepage{}  von \pageref{LastPage}}
}

\DeclareOption{SingleHeader}{
	%Header Options
	\ihead{\groupmember}
	\chead{\textbf{\topic - \group}}
	\ohead{Übungsblatt \exercisenumber}
	
	%Footer Options
	\ifoot{\footnotesize  \thesection}
	\cfoot{\footnotesize Version vom \today{} um \currenttime{} Uhr}
	\ofoot{\footnotesize Seite \thepage{}  von \pageref{LastPage}}
}

\pagestyle{scrheadings} 

\ExecuteOptions{}
\ProcessOptions

%
%Commonly needed mathematic symbols
%

\newcommand{\N}{\mathbb{N}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\gfloor}[1]{\lfloor #1 \rfloor}
\newcommand{\gceil}[1]{\lceil #1 \rceil}
\newcommand{\Set}[1]{\{#1\}}
\newcommand{\TextSet}[1]{$\{#1\}$}

%
%Personal Informations
%

\settopic{Example Fach}
\setgroupmember{Max Mustermann (111111)}
\setgroupnumber{Gruppe XX}

%
%Ende
%
\endinput



