\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancv}

\LoadClass[a4paper]{article}

\RequirePackage{parskip}
\RequirePackage[md]{titlesec}
\RequirePackage[ top = 1.5in
			   , left = 1.5in
               , right = 1.5in
			   , bottom = 1.5in]{geometry}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{tabto}
\RequirePackage{enumitem}
\RequirePackage{pbox}
\RequirePackage{pdftexcmds}
\RequirePackage{microtype}
\RequirePackage{fontspec} % opentype typography
\RequirePackage{kvoptions} % key-value options

\SetupKeyvalOptions{ family = fancv
                   , prefix = fancv@
                   }

\DeclareStringOption[]{colour}
\DeclareStringOption[]{phone}
\DeclareStringOption[]{email}
\DeclareStringOption[]{github}
\DeclareStringOption[]{name}
\DeclareStringOption[]{position}

\ProcessKeyvalOptions{fancv}

\def\labelitemi{---}

% Configure typesetting defaults
\setmainfont{EB Garamond}
\setmonofont{CMU Typewriter Text}

% Hyperlink colour
\definecolor{linkcolour}{rgb}{0.6,0.1,0.2}
\hypersetup{ colorlinks = true 
           , allcolors  = linkcolour
           }

% Disable page numbering
\pagenumbering{gobble} 

% Redefine the title format
\def\@maketitle{%
  \newpage
  \let \footnote \thanks
    \bgroup
        \setlength{\parindent}{0pt}
	\begin{minipage}{.65\linewidth}
		\begin{flushleft}
			{\huge\textcolor[HTML]{\fancv@colour}{\textsc{\fancv@name}}}
		\end{flushleft} 
		\vskip 0.8em%
		\textit{\large\fancv@position}
	\end{minipage}
	\hfill
	\begin{minipage}{.35\linewidth}
		\begin{flushright}                                      
			\begin{tabular}{r l}
				\textsc{\textcolor[HTML]{999999}{github:}} & \fancv@github \\
				\textsc{\textcolor[HTML]{999999}{email:}} & \fancv@email \\
				\textsc{\textcolor[HTML]{999999}{phone:}} & \fancv@phone \\
			\end{tabular}
		\end{flushright} 
	\end{minipage}
	\egroup
  \vskip 0.2em%
  \noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}%
  \vskip 1.5em%
}

% Redefine the section format
\titleformat{\section}{\normalfont\LARGE\mdseries\scshape}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{*2}{*1}

\newcommand{\parr}{\par\vspace{-1pt}}

\newcommand{\newkvcmd}[2]{%
  \newcommand{#1}[1]{%
    \setkeys{fancv}{##1}
    #2
  }
}


\def\addmargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endaddmargin=\endlist 

\newenvironment{placement}[3]
{
	\pbox[t]{\textwidth}{\Large{#1}\\\normalsize\textsc{#3}} \quad {\large\textit{#2}}
	\list{}{\rightmargin1em\leftmargin1em}\item[]
}
{\vspace{1em}\endlist}

\newenvironment{inline-item}[3]
{
	#3 \quad {\large #1},\ \textit{#2}
	\list{}{\rightmargin1em\leftmargin1em}\item[]
}
{\endlist}
