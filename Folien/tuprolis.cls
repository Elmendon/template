\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{../tuprolis}[2020/05/28]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\RequirePackage[abspath,realmainfile,parent]{currfile}
\LoadClass[xcolor=dvipsnames]{beamer}
\usetheme[progressbar=none, block=fill, subsectionpage=none]{metropolis}
\RequirePackage{xcolor}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}

%----------------------------------------------------------
%Switch für verschiedene Interpreter
%----------------------------------------------------------

\ifluatex %
    \RequirePackage[english,ngerman]{babel} %
\else %
    \ifxetex %
        \RequirePackage[english,ngerman]{babel} %
    \else %
        \RequirePackage[english,ngerman]{babel} %
        \RequirePackage[utf8]{inputenc} %
        \RequirePackage[T1]{fontenc} %
    \fi %
\fi

%----------------------------------------------------------
%Fonts
%----------------------------------------------------------

\setbeamerfont{frametitle}{size=\large, series=\bfseries}
\setbeamerfont{block title}{series=\bfseries}
\setbeamerfont{section in toc}{series=\bfseries}
\setbeamerfont*{title}{size=\huge}

%----------------------------------------------------------
%Farben
%----------------------------------------------------------

\xdefinecolor{tugreen}{RGB}{132, 184, 25}       
\colorlet{tulight}{tugreen!20!white}
\colorlet{tudark}{tugreen!60!black}

%Titelpage
\setbeamercolor{title}{fg=tugreen, bg=white}
%
%Footer Color
\setbeamercolor{structure}{fg=tugreen, bg=white}
%
%Frametitel
\setbeamercolor{frametitle}{fg=black, bg=tugreen}
%
%Lineseperator
\setbeamercolor{lower separation line head}{bg=tudark}

\setbeamercolor{progress bar}{fg=tudark, bg=tulight}

\setbeamercolor{footline}{fg=tugreen}

%Alertblock
\setbeamercolor*{block title alerted}{fg=white,bg=red!70}
\setbeamercolor*{block body alerted}{fg=darkgray,bg=red!20}

%----------------------------------------------------------
%Template Optionen
%----------------------------------------------------------

\ExecuteOptions{}
\ProcessOptions

\endinput
