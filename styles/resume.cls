% Resume Class File
%
% Original Author:
% Claud D. Park <posquit0.bj@gmail.com>
% https://github.com/posquit0/Awesome-CV
% http://www.posquit0.com
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
% Modified by Madhu Krishnan <ping@madhuvk.com>
% https://www.madhuvk.com

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{styles/accent-resume}[2023/12/10 v3.0.0 Accent Resume Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Inherit options of article
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage[shortlabels]{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to manage colors
\RequirePackage{xcolor}
% Provide \forloop command
\RequirePackage{pgffor}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to keep enum bullets small
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome5}
\RequirePackage{roboto}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode,pdfpagelabels=false]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Solves issues Warning: File `cv.out' has changed
\RequirePackage{bookmark}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Default Colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{dark}{HTML}{414141}

% Text colors
\colorlet{darktext}{dark}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
\colorlet{sectiondivider}{gray}

% Accent color
\colorlet{accent}{darkgray}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newcommand*{\headerfont}{\roboto}
\newcommand*{\headerfontlight}{\robotolight}
\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{30pt}{1em}\headerfontlight\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{30pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9.5pt}{1em}\bodyfont\scshape\color{accent} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\color{accent} #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10.5pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9.5pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{9.0pt}{1em}\bodyfont\slshape\color{accent} #1}}
\newcommand*{\entryskillstyle}[1]{{\fontsize{9.0pt}{1em}\bodyfont\upshape\color{darktext} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9.0pt}{1em}\bodyfont\upshape\color{darktext} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9.5pt}{1em}\bodyfont\bfseries\color{darktext} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10.0pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9.0pt}{1em}\bodyfont\color{text} #1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}

% Define writer's position
% Usage: \position{<position>}{<subposition>}
\newcommand*{\position}[2]{\def\@position{#1}\def\@subposition{#2}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{0mm}
\newcommand{\acvSectionContentTopSkip}{-.75mm}
\newcommand{\acvEntrySectionSkip}{-5.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newlength{\headertextwidth}
  \setlength{\headertextwidth}{\textwidth}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}~~~~\headerlastnamestyle{\@lastname}\\[\acvHeaderAfterNameSkip]%
    \headerpositionstyle{
      {\enskip\cdotp\enskip}\@position
      {\enskip\cdotp\enskip}\@subposition
      {\enskip\cdotp\enskip}
    }\\[\acvHeaderAfterPositionSkip]
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{mailto:\@email}{\faEnvelope\acvHeaderIconSep\@email}%
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{\@homepage}{\faHome\acvHeaderIconSep\@homepage}%
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\acvHeaderIconSep\@linkedin}%
        }%
    } \\[\acvHeaderAfterSocialSkip]%
  \end{minipage}%
}


% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \begin{justify}
    \begin{itemize}[leftmargin=2.25ex, itemsep=0.20ex, parsep=0.50ex]
      \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{\acvEntrySectionSkip}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{R{2.5cm} L{\textwidth - 2.0cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth - 2.75cm}}
}{%
    \end{tabular*}
  \end{center}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \color{sectiondivider}\vhrulefill{0.9pt}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \subsectionstyle{#1}
  \phantomsection
}

% Define an entry of cv degrees
% Usage: \cveducation{<title>}{<date>}{<degree>}{description>}
\newcommand*{\cveducation}[4]{%
  \vspace{\acvSectionContentTopSkip}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#1} & \entrydatestyle{#2} \\
    \entrypositionstyle{#3} \\ [\acvEntrySectionSkip]
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#4}}
  \end{tabular*}%
}

% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<skills>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \vspace{\acvSectionContentTopSkip}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#2} \\ [-0.5mm]
    \entrypositionstyle{#1} & \entrydatestyle{#4} \ifempty{#3}{\\ [-4.0mm]}{\\ [-0.5mm]}
    \ifempty{#3}{\\ [-5.5mm]}{\entryskillstyle{#3} \\ [-3.5mm]}
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
}

% Hack: Define an entry of cv information with 3 entries
% Usage: \cvthreeentry{<organization>}{<skills>}[{<position>}{<date>}]x3{<description>}
\newcommand*{\cvthreeentry}[9]{%
  \vspace{\acvSectionContentTopSkip}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#1} \\ [-0.5mm]
    \entrypositionstyle{#3} & \entrydatestyle{#4} \\[-1.5mm]
    \entrypositionstyle{#5} & \entrydatestyle{#6} \\[-1.5mm]
    \entrypositionstyle{#7} & \entrydatestyle{#8} \\ [-0.5mm]
    \entryskillstyle{#2} \\ [-3.5mm]
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#9}}
  \end{tabular*}%
}

% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<date>}
\newcommand*{\cvhonor}[3]{%
  \honorpositionstyle{#1} & \honortitlestyle{#2} & \entrydatestyle{#3} \\
}

% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}
