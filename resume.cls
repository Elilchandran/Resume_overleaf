
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/03/18 v0.1 Resume class]

\LoadClass[11pt,a4paper]{article} % Font size and paper type for A4 size

% set document margins
%\usepackage[left=0.5 in,top=0.4in,right=0.5in,bottom=0.3in]{geometry}
\usepackage[left=0.4in,top=0.4in,right=0.4in,bottom=0.3in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{keycommand}

\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
%\usepackage[scaled]{helvet} % Load the Helvetica font
%\renewcommand\familydefault{\sfdefault} % Set the default font family to sans-serif
%\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

% Load the fontspec package to set the font
\usepackage{newtxtext} % Times New Roman text
\usepackage{newtxmath} % Times New Roman math (optional)

\pagestyle{empty}

\def \separator {\textbf{\Large\textbullet}}

\newcommand\printNameTitle[1]{%
    \begingroup
    \hfill{\MakeUppercase{\Huge\bfseries #1}}\hfill
    \break
    \vspace{-0.5em}
    \hrule
    \endgroup
}

\usepackage{fontawesome5}

\newcommand{\printContactInformation}{%
  \vspace{-0.3em} % remove vertical space above
  \begin{center}
     \ifcommandkey{email}{%
        \hspace{0.5em}\faEnvelope\hspace{0.5em}\href{mailto:\commandkey{email}}{\commandkey{email}}%
    }{}%
    \ifcommandkey{linkedin}{%
        \hspace{0.5em}\faLinkedin\hspace{0.5em}\href{\commandkey{linkedin}}{LinkedIn}%
    }{}%
    \ifcommandkey{github}{%
        \hspace{0.5em}\faGithub\hspace{0.5em}\href{\commandkey{github}}{GitHub}%
    }{}%
    \ifcommandkey{portfolio}{%
        \hspace{0.5em}\faGlobe\hspace{0.5em}\href{\commandkey{portfolio}}{Portfolio}%
    }{}%
    \ifcommandkey{location}{%
        \hspace{0.5em}\faMapMarker\hspace{0.5em}\commandkey{location}%
    }{}%
    \ifcommandkey{phone}{%
        \hspace{0.5em}\faPhone\hspace{0.5em}\commandkey{phone}%
    }{}%
  \end{center}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}

%\newkeycommand{\introduction}[fullname,email,phone,linkedin,github,portfolio,location]{
 %   \printNameTitle{\commandkey{fullname}}
  %  \printContactInformation
%}
\renewcommand\printNameTitle[2]{%
    \begingroup
    {\MakeUppercase{\Huge\bfseries #1}} \hspace{0.1em} | {\small\bfseries #2}\hfill
    \break
    \vspace{-0.4em}
    \hrule
    \endgroup
}

\newkeycommand{\introduction}[fullname,email,phone,linkedin,github,portfolio,location]{
    \begingroup
    \renewcommand\printNameTitle[2]{%
        {\MakeUppercase{\huge\bfseries ##1}} \hspace{0.1em} | {\mdseries\large\bfseries ##2}\hfill
        \break
        \vspace{-1em} % Adjust the value as needed
        \hrule
        \vspace{0.5em} % Adjust the value as needed
    }
    \printNameTitle{\commandkey{fullname}}{Full Stack Developer}
    \printContactInformation
    \endgroup
}



\newcommand{\summary}[1]{
    \textbf{\MakeUppercase{Summary}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
    #1
}

\newcommand{\education}{
    \textbf{\MakeUppercase{Education}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\educationItem}[university,college,program,graduation,grade,coursework]{
    {\bf \commandkey{program}} \hfill { \commandkey{graduation}} \\
    {\commandkey{university}} \hfill \ifcommandkey{grade}{\commandkey{grade}}{} \\
    \ifcommandkey{college}{\hfill{\commandkey{college}}}{} \\
     \ifcommandkey{coursework}{ \commandkey{coursework}}{\vspace{-0.8em}} % Adjust the value as needed
}

\newcommand{\skills}{
    \textbf{\MakeUppercase{Technical skills}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newcommand{\skillItem}[2]{%
    \par\noindent
    \begin{minipage}[t]{0.4\textwidth}
        \textbf{#1}
    \end{minipage}%
    \begin{minipage}[t]{0.6\textwidth}
        #2
    \end{minipage}\par
}

\newenvironment{workSection}[1]{
  \textbf{\MakeUppercase{#1}}
  \vspace{0.4em}
  \hrule
  \vspace{-0.3em}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

\renewcommand\printNameTitle[2]{%
    \begingroup
    {\MakeUppercase{\Huge\bfseries #1}} \hspace{0.1em} | {\small\bfseries #2}\hfill
    \break
    \vspace{-1em} % Adjust the value as needed
    \hrule
    \vspace{0.5em} % Adjust the value as needed
    \endgroup
}




\newkeycommand{\experienceItem}[company, position, location, duration]{
    \textbf{\commandkey{company}, \commandkey{location}: \commandkey{position}} \hfill {\commandkey{duration}}
}

\newkeycommand{\customItem}[title, duration, keyHighlight]{
    \textbf{\commandkey{title}} \ifcommandkey{duration}{\hfill {\commandkey{duration}}}{} \\
    \ifcommandkey{keyHighlight}{\vspace{-1.5em}\commandkey{keyHighlight}\vspace{-0.5em}}{}
}
