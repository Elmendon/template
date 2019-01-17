\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abgaben}[v. 1.1]
\LoadClass[10pt,numbers = noendperiod]{scrartcl}

%
%Packages
%

%Prüfen welcher compiler verwendet wird, sollte die verwendung von XeTeX/LuaTeX ermöglichen
\usepackage{ifxetex,ifluatex}
\ifluatex
    \usepackage{polyglossia} 
    \setmainlanguage{german}
    \setotherlanguage{english}
\else
    \ifxetex
        \usepackage{polyglossia}
        \setmainlanguage{german}
        \setotherlanguage{english}
    \else
        \RequirePackage[T1]{fontenc}
        \RequirePackage[utf8]{inputenc}
        \RequirePackage[ngerman,english]{babel}
    \fi
\fi

\RequirePackage{lmodern} 
%\usepackage{libertineotf}
\RequirePackage{amsmath} 
\RequirePackage{mathtools}
%\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
%\RequirePackage{ifthen}
%\RequirePackage{icomma}
%\RequirePackage{etoolbox}
\RequirePackage[width=18.00cm, height=25.00cm, head=25pt, top=2.5cm]{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage[headsepline]{scrlayer-scrpage}
\RequirePackage[framemethod=TikZ,nobreak=true]{mdframed}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{adjustbox}
\RequirePackage{tabularx}
\RequirePackage{todonotes}
\RequirePackage{tikz}
\usetikzlibrary{shapes.misc, positioning}
\RequirePackage{environ}

%
%Customization
%

%Header Options
\renewcommand{\headfont}{\normalfont}
\clearpairofpagestyles
\ihead{\textbf{\topic} \\ \footnotesize \groupmember}
\chead{\raisebox{\baselineskip}{\textbf{\group}}}
\ohead{\raisebox{\baselineskip}{\textbf{\exercisenumber}}}
\pagestyle{scrheadings} 

%Redifine Section counter
\renewcommand\thesection{Aufgabe \arabic{section}}
\renewcommand\thesubsection{\arabic{subsection})}
\renewcommand\thesubsubsection{(\alph{subsubsection})}

%Set todo to inline mode
\presetkeys{todonotes}{inline}{}

%\pgfplotsset{compat=newest}

%
%Commands
%

%Header Commands
\newcommand{\settopic}[1]{\newcommand{\topic}{#1 Übung}}
\newcommand{\setgroupmember}[1]{\newcommand{\groupmember}{}}
\newcommand{\setgroupnumber}[1]{\newcommand{\group}{}}
\newcommand{\setexercisenumber}[1]{\newcommand{\exercisenumber}{Übungsblatt #1}}

%Abgabenspezifische Commands
\newcommand{\added}[1]{\textcolor{red}{#1}}


%
%Environments
%

%Definitions-Environment
\newenvironment{definition}[1][]
{
    \mdfsetup{
    frametitle={%
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rounded corners,rectangle,fill=gray!50]
        {\strut #1};},roundcorner = 5pt,
    innertopmargin=0pt,linecolor=gray!30,%
    linewidth=2pt,topline=true,%
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
    }
    \begin{mdframed}[]
}
{\end{mdframed}}

%Solutionenvironment
\newenvironment{solution}
{
    \mdfsetup{
    frametitle={%
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rounded corners ,rectangle,fill=red!70]
        {\strut Lösung};},roundcorner = 5pt,
    innertopmargin=0pt,linecolor=red!50,%
    linewidth=2pt,topline=true,%
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
    }
    \begin{mdframed}[]
}
{\end{mdframed}}

%Question environment
\newenvironment{question}[1][]
{
    \mdfsetup{
    frametitle={%
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rounded corners, rectangle,fill=green!50]
        {\strut Frage #1};},roundcorner = 5pt,
    innertopmargin=0pt,linecolor=green!30,%
    linewidth=2pt,topline=true,%
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
    }
    \begin{mdframed}[]
}
{\end{mdframed}}

%Question environment
\newenvironment{info}[1][]
{
    \mdfsetup{
    frametitle={%
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rounded corners, rectangle,fill=blue!50]
        {\strut \ifstrequal{#1}{}{Info}{#1}};},roundcorner = 5pt,
    innertopmargin=0pt,linecolor=blue!30,%
    linewidth=2pt,topline=true,%
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
    }
    \begin{mdframed}[]
}
{\end{mdframed}}


%
%Class Options
%
\DeclareOption{Abgabe}{
    \RenewEnviron{question}[1]{}
    \RenewEnviron{info}[1]{}
    \RenewEnviron{solution}[1]{}
    \presetkeys{todonotes}{disable}{}
    \renewcommand{\setgroupmember}[1]{\newcommand{\groupmember}{#1}}
    \renewcommand{\setgroupnumber}[1]{\newcommand{\group}{Gruppe #1}}
}

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

\settopic{Test}
\setgroupmember{Max Mustermann}
\setgroupnumber{00}



%
%Ende
%
\endinput



