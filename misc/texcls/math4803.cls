%=====================================================================
% homework.cls
% Provide homework.cls class
%=====================================================================

%=====================================================================
% Identification
%=====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs2051}[CS 2051 Class]

\LoadClass[letterpaper, 12pt]{article}

\RequirePackage{fancyhdr}
\RequirePackage{amssymb}
\RequirePackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{empheq}
\RequirePackage{parskip}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{mdframed}
\RequirePackage{algorithm}
\RequirePackage{subcaption}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage[noend]{algpseudocode}

\setlength{\headheight}{15pt}
\lhead{\@author}\chead{\@title}\rhead{\today}
\lfoot{}\cfoot{\thepage}\rfoot{}
\pagestyle{fancy}

\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]
\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}

\newcommand*{\problem}[1][]{\stepcounter{ProblemNum} %
   \subsection*{Problem \theProblemNum. \; #1}}

\renewcommand*{\part}{\stepcounter{SubProblemNum} %
   \subsubsection*{Part (\theSubProblemNum)}}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}

\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\renewcommand{\P}{\mathbb{P}}

\newcommand{\J}{\hat{J}}
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\chev}[1]{\left<#1\right>}

\makeatletter
\newcommand{\ox}[1]{#1\oxNextArg}
\newcommand{\oxNextArg}{\@ifnextchar\bgroup{\oxGobbleArg}{}}
\newcommand{\oxGobbleArg}[1]{ \otimes #1\@ifnextchar\bgroup{\oxGobbleArg}{}}
