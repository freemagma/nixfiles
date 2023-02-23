\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math}[Math Class]

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
\RequirePackage[noend]{algpseudocode}
\RequirePackage{xfp}
\RequirePackage{pdfpages}
\usepackage[shortlabels]{enumitem}

\setlength{\headheight}{15pt}
\lhead{\@author}\chead{\@title}\rhead{\@date}
\lfoot{}\cfoot{\thepage}\rfoot{}
\pagestyle{fancy}

\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]
\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}

\newcommand*{\problem}[1][]{\stepcounter{ProblemNum} %
   \subsection*{Problem \theProblemNum. \; #1}}

\newcommand*{\problemn}[2][]{\setcounter{SubProblemNum}{0} %
   \subsection*{Problem #2. \; #1}}

\renewcommand*{\part}{\stepcounter{SubProblemNum} %
   \subsubsection*{Part (\theSubProblemNum)}}

\newcommand*{\partn}[1]{\subsubsection*{Part (#1)}}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}

\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\F}{\mathbb{F}}
\renewcommand{\P}{\mathbb{P}}

\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\chev}[1]{\left<#1\right>}
\newcommand{\bra}[1]{\left<#1\right|}
\newcommand{\ket}[1]{\left|#1\right>}

\newcommand{\ndiv}{\hspace{-4pt}\not|\hspace{2pt}}
\newcommand{\mb}[1]{\mathbf{#1}}
\newcommand{\f}[2]{\frac{#1}{#2}}
\newcommand{\Log}[1]{\text{Log}\:#1}
\newcommand{\ve}{\varepsilon}
\newcommand{\bm}[1]{\begin{bmatrix}
   #1
\end{bmatrix}}
\newcommand{\sbm}[1]{\left[\begin{smallmatrix}
   #1
\end{smallmatrix}\right]}

\newcommand{\sep}{%
   \vspace{8pt}
   \hrule
}

\usepackage{xparse}
\ExplSyntaxOn
\NewExpandableDocumentCommand{\extr}{O{#2}mm}
 {
  \tl_range:nnn { #3 } { #1 } { #2 }
 }
\ExplSyntaxOff

\usepackage{ifthen}
\newcommand{\eip}[2]{%
   e^{\ifthenelse{\equal{#2}{1}}{
      \ifthenelse{\equal{\extr{1}{#1}}{-}}{-}{}
      \ifthenelse{\equal{#1}{1} \or \equal{#1}{-1}}{}{
            \ifthenelse{\equal{\extr{1}{#1}}{-}}{
               \extr[2]{-1}{#1}
            }{#1}
      } \pi i
   }{
      \ifthenelse{\equal{\extr{1}{#1}}{-}}{-}{}
      \frac{
         \ifthenelse{\equal{#1}{1} \or \equal{#1}{-1}}{}{
            \ifthenelse{\equal{\extr{1}{#1}}{-}}{
               \extr[2]{-1}{#1}
            }{#1}
         } \pi
      }{#2} i
}}}
