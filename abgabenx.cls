\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abgabenx}[v. 1.2]
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
\newcommand{\Task}[2]{
	\begin{flushleft} \textbf{Aufgabe \exercisenumber.\arabic{taskCounter}} \xspace [#1]
	\hfill
	#2
	\end{flushleft}
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
		\item Bei mehrfachen Abgaben des gleichen Blattes, bitte immer die letzte abgegebene Version werten!
	\end{itemize}
\end{mdframed}	
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
\newmdenv[linecolor=red,
	frametitle=Lösung,
	frametitlebackgroundcolor=red!70,
	style=enviStyle
	]{solution}

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
	nobreak = false,
	]{probSolBox}
	
\newenvironment{proposedSol}[1][]
{
	\begin{probSolBox}
		\begin{enumerate}[#1]
}
{
		\end{enumerate}
	\end{probSolBox}
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

\settopic{Test Übung}
\setgroupmember{Max Musterman (112233)}
\setgroupnumber{Test Gruppe}

%
%Ende
%
\endinput