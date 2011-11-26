%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is unofficial SNU EE LaTeX class.
%% 
%% Author: zeta709
%% Version: 0.97
%% Releasedate: 2011/11/27
%%
%% 서울대 전기공학부 졸업논문 LaTeX template이다.
%% 학사, 석사, 박사 양식을 모두 지원한다.
%%
%% 사실 귀찮아서 글마당에 올라온 기존 template을 쓰려고 했으나,
%% 결정적으로 저자가 사용하려는 패키지와 기존 template 사이에
%% 너무 해결하기 어려운 충돌이 발생해서 이것을 만들게 되었다.
%% 그렇다고 무에서 시작한 것은 아니고
%% 학부 때 학부 전용으로 template을 만들어 둔 것에
%% 대학원 양식을 추가한 것이다.
%% (물론 그 과정에서는 기존 양식을 참고했다.)
%%
%% 기존 양식에는 사소한 버그가 있었다.
%% 페이지 번호가 이상하다거나, pdf 크기를 자동으로 안 잡아준다거나,
%% 양면 인쇄를 상대적으로 덜 고려했다거나하는 것 등이다.
%% 여기서는 기존 양식의 몇 가지 버그를 해결한 동시에
%% 원래는 잘 되던 것이 여기서는 안 될지도 모르겠다.
%%
%% 예전에 학부 양식을 만들 당시에는 jdj가 만든 학부 양식을 참고하였으나,
%% 사실상 대부분을 다시 작성하였던 것 같다.
%% 그리고 jdj가 KAIST 양식을 참고했다고 하여, 저자 역시
%% KAIST 양식도 참고했었다.
%% KAIST의 양식이 최초(?)의 국내 대학원 LaTeX 논문 양식이라
%% 다방면에 영향을 준 것일지도 모르겠다.
%%
%% 패키지 충돌에 당해본 관계로 이 양식은
%% 의존 패키지를 최소화하는 방향으로 만들었다.
%% 잘 되려나 모르겠다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%
%% ko: 한글 논문을 작성한다.
%%
%% indentfirst: indentfirst 패키지를 사용한다.
%% noindentfirst: indentfirst 패키지를 사용하지 않는다.
%% 이것은 각 section의 첫 단락에서 들여쓰기를 할 지 말 지 결정하는 옵션이다.
%% 한글 논문에서는 사용하는 것이 기본이고,
%% 영문 논문에서는 사용하지 않는 것이 기본이다.
%%
%% easy: 편리한 설정을 위한 옵션이다.
%%
%% draft, final, leqno, fleqn, openright, openay,
%% openbib, oneside, twoside: report class에 전달한다.
%% 이 옵션들의 의미는 LaTeX 입문서에 설명되어 있다.
%%
%% nonfrench, finemath, strictcharcheck: kotex package에 전달한다.
%% 이 옵션들의 의미는 ko.TeX 사용 설명서에 설명되어 있다.
%%
%% under: 학사
%% ms, master: 석사
%% phd, doctor: 박사
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 사용 환경
%% 
%% TeXLive를 추천한다.
%%
%% 의존성
%% 반드시 필요한 클래스와 패키지들은 다음과 같다.
%%
%% * report class
%% 기반 클래스이다.
%% * kotex package
%% 영어 논문을 써도 국문 초록을 넣어야 하므로 이 패키지가 필요하다.
%%
%% 그 외에 옵션에 따라 다른 패키지가 필요할 수 있다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 기타
%% 
%% @snu@ko와 같이 @을 넣는 것은 명령어를 내부 명령어로 사용하는 것이다.
%% 그리고 @snu를 넣은 것은 다른 패키지와 충돌할 가능성을 방지하기 위해서이다.
%% 
%% memoir나 oblivior 등의 클래스도 좋다고 생각하지만 호환성 등을 생각해서
%% report 클래스를 기반으로 하였다.
%%
%% 패키지를 수정할 때는 주석을 읽어보고 수정하는 것이 좋다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{snueethesis}
[2011/11/27 v0.97 unofficial SNU EE LaTeX class]

\newif\if@snu@under
\newif\if@snu@ms
\newif\if@snu@phd

\newif\if@snu@ko %% true이면 국문 논문.
\@snu@kofalse %% 기본값은 영문 논문.

\newif\if@snu@indentfirst %% true이면 section의 첫 단락도 들여쓴다.
\@snu@indentfirstfalse
\newif\if@snu@indentoptionset
\@snu@indentoptionsetfalse

\newif\if@snu@easy %% easy 옵션. 이것저것 대신 해줌.
\@snu@easyfalse %% 기본값은 false.

\DeclareOption{under}{\@snu@undertrue \@snu@msfalse \@snu@phdfalse}
\DeclareOption{ms}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{master}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{phd}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}
\DeclareOption{doctor}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}

\DeclareOption{ko}{\@snu@kotrue}
\DeclareOption{indentfirst}{\@snu@indentfirsttrue \@snu@indentoptionsettrue}
\DeclareOption{noindentfirst}{\@snu@indentfirstfalse \@snu@indentoptionsettrue}
\DeclareOption{easy}{\@snu@easytrue}

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{final}{\PassOptionsToClass{final}{report}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{report}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}
%% report class의 나머지 옵션은 의도적으로 제공하지 않음.

\DeclareOption{nonfrench}{\PassOptionsToClass{nonfrench}{kotex}}
\DeclareOption{finemath}{\PassOptionsToClass{finemath}{kotex}}
\DeclareOption{strictcharcheck}{\PassOptionsToClass{strictcharcheck}{kotex}}
%% hangul, nojosa, hanja 옵션은 의도적으로 제공하지 않음.

\ExecuteOptions{phd} % phd가 기본인 것은 박사에게 제공하는 작은 혜택?
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% "\if@snu@under"는 학부를 의미함.
%% "\if@snu@ko"는 한글 논문을 의미함. 

\newcommand{\@snu@koen}{%
	\if@snu@ko \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@koen{한글}{English}

\newcommand{\@snu@msphd}{%
	\if@snu@ms \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@msphd{M.S.}{Ph.D.}

%% ProcessOptions 뒤에 나와야 정상적으로 동작한다.
\if@snu@under % 학부
	\if@snu@ko
		\PassOptionsToClass{a4paper,10pt}{report}
	\else
		\PassOptionsToClass{a4paper,11pt}{report}
	\fi
\else % 대학원
	\PassOptionsToClass{b5paper,11pt}{report}
\fi
\LoadClass[onecolumn]{report}

\if@snu@ko
	\RequirePackage{kotex} %% hangul 옵션에 대해 테스트 중.
	%% The UK TeX FAQ
	%% Your 437 Questions Answered
	%% version 3.19a, date 2009-06-13, p.211.
	\renewcommand{\abstractname}{초록} %
	%\renewcommand{\alsoname}{see also} % (makeidx package)
	\renewcommand{\appendixname}{부록} %
	\renewcommand{\bibname}{참고문헌} % (report,book)
	%\renewcommand{\ccname}{cc} % (letter)
	%\renewcommand{\chaptername}{Chapter} % (report,book)
	\renewcommand{\contentsname}{목차} %
	%\renewcommand{\enclname}{encl} % (letter)
	\renewcommand{\figurename}{그림} % (for captions)
	%\renewcommand{\headtoname}{To} % (letter)
	\renewcommand{\indexname}{색인} %
	\renewcommand{\listfigurename}{그림 목차} %
	\renewcommand{\listtablename}{표 목차} %
	%\renewcommand{\pagename}{Page} % (letter)
	%\renewcommand{\partname}{Part} %
	%\renewcommand{\refname}{References} % (article)
	%\renewcommand{\seename}{see} % (makeidx package)
	\renewcommand{\tablename}{표} % (for caption)
	\newcommand{\keywordname}{주요어}
	\newcommand{\keywordnamealt}{Keywords}
	\newcommand{\studentnumbername}{학번}
	\newcommand{\studentnumbernamealt}{Student Number}
	\newcommand{\abstractnamealt}{Abstract}
	\newcommand{\acknowledgementname}{감사의 글}
	%% 참고사항
	%% kotex에 [hangul] 옵션을 주면
	%% 여기서 변경한 사항이 덮어쓰여진다.
	%% babel 패키지도 비슷한 역할을 할 수 있다.
\else
	\RequirePackage{kotex} %% 국문 초록 때문에 필요하다.
	%% The UK TeX FAQ
	%% Your 437 Questions Answered
	%% version 3.19a, date 2009-06-13, p. 211.
	%\renewcommand{\abstractname}{Abstract} %
	%\renewcommand{\alsoname}{see also} % (makeidx package)
	%\renewcommand{\appendixname}{Appendix} %
	%\renewcommand{\bibname}{Bibliography} % (report,book)
	%\renewcommand{\ccname}{cc} % (letter)
	%\renewcommand{\chaptername}{Chapter} % (report,book)
	%\renewcommand{\contentsname}{Contents} %
	%\renewcommand{\enclname}{encl} % (letter)
	%\renewcommand{\figurename}{Figure} % (for captions)
	%\renewcommand{\headtoname}{To} % (letter)
	%\renewcommand{\indexname}{Index} %
	%\renewcommand{\listfigurename}{List of Figures} %
	%\renewcommand{\listtablename}{List of Tables} %
	%\renewcommand{\pagename}{Page} % (letter)
	%\renewcommand{\partname}{Part} %
	%\renewcommand{\refname}{References} % (article)
	%\renewcommand{\seename}{see} % (makeidx package)
	%\renewcommand{\tablename}{Table} % (for caption)
	\newcommand{\keywordname}{Keywords}
	\newcommand{\keywordnamealt}{주요어}
	\newcommand{\studentnumbername}{Student Number}
	\newcommand{\studentnumbernamealt}{학번}
	\newcommand{\abstractnamealt}{초록}
	\newcommand{\acknowledgementname}{Acknowledgements}
\fi

\if@snu@indentoptionset
    \if@snu@indentfirst
	\RequirePackage{indentfirst}
    \fi
\else
    \if@snu@ko
	\RequirePackage{indentfirst}
    \fi
\fi

\RequirePackage{ifpdf}

%% maketitle 명령 제거.
\let\oldmaketitle=\maketitle
\renewcommand\maketitle{}

%% 여백 설정.
%% lshort.pdf의 page layout을 참고하면 좋다.
%% 또는 "latex page layout"정도로 검색하면 된다.
%% a4paper : 210 mm X 297 mm
%% B5 (ISO) : 176 mm X 250 mm
%% B5 (JIS) : 182 mm X 257 mm
%% 4X6배판 : 188 mm X 258 mm
%% 학부 양식에서는 A4를 사용한다.
%% 대학원의 hwp, doc 양식은 B5 (JIS)를 쓰고 있다.
%% LaTeX의 b5paper는 ISO 규격이로 약간 작으므로,
%% 직접 고쳐준다.

\if@snu@under
	\setlength{\paperwidth}{210mm}
	\setlength{\paperheight}{297mm}
	\setlength{\textwidth}{160mm} %% 210 mm - (2.5 cm)*2
	\setlength{\textheight}{232mm} %% 297 mm - 3 cm - 3.5 cm
	% 좌우 여백 2.5 cm
	% 상단 여백 3 cm, 하단 여백 3.5 cm
\else
	\setlength{\paperwidth}{182mm}
	\setlength{\paperheight}{257mm}
	\setlength{\textwidth}{132mm} %% 182 mm - (2.5 cm)*2
	\setlength{\textheight}{192mm} %% 257 mm - 3 cm - 3.5 cm
	% 좌우 여백 2.5 cm
	% 상단 여백 3 cm, 하단 여백 3.5 cm
\fi
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{30mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm} %% 헤더는 사용하지 않음.
\addtolength{\marginparwidth}{-1.2cm} %% 안 중요함.
%\setlength{\marginparsep}{3mm} %% 상관 없음.
\setlength{\oddsidemargin}{25mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\footskip}{20mm} % 아래 page number 위치
\ifpdf
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
\fi

%% 줄간격
\if@snu@under
	%% 배행간 설정이 조금 까다롭다.
	%% 영문은 1.6으로 하고, 한글은 1.75나 2.0으로 해야 한다는 주장도 있다.
	\linespread{1.75} % Doblespacing
\else
	\if@snu@ko
	\linespread{1.6} % 170% (?)
	\else
	\linespread{1.5} % 170% (?)
	\fi
\fi
\let\@snu@oldfootnote=\footnote
\renewcommand{\footnote}[1]{\linespread{1.0}\@snu@oldfootnote{#1}}

%% \@onlypreamble 남용 금지.
%% \@onlypreamble을 남용하는 것은 좋지 않다.
%% 표지에는 영문 성명을 넣고
%% 인준지에는 한글 성명을 넣고 싶은 사람도 있을 것이고,
%% 양쪽 모두에 한글 성명을 사용하고 싶은 사람도 있을 것이다.
%% 그렇기 때문에 \authorko와 \authoren을 따로
%% 만드는 방법은 완전한 해결 방법이 될 수 없다.
%% 그래서 단순히 \author과 \author*만은 만들었다.
%% 여기서 *이 붙은 버전은 멋(?)을 내기 위한
%% 스페이스를 넣은 이름을 쓰기 위해서 사용한다.
%% 아무튼 \makefrontcover와 \makeapproval 사이에서
%% 이름을 바꾸는 것을 허용하면,
%% 영문 성명과 한글 성명을 섞어 쓰고 싶은 사람도
%% 배려할 수 있게 된다.

%% 제목
\let\@oldtitle=\title
\def\title{\@ifstar\@snu@title\@oldtitle}
\def\@snu@title#1{\gdef\@titlealt{#1}}
\def\@titlealt{\@latex@error{No \noexpand\title* given}\@ehc}
%\@onlypreamble{\title}

%% 이름
\let\@oldauthor=\author
\def\author{\@ifstar\@snu@authoralt\@oldauthor}
\def\@snu@authoralt#1{\gdef\@authoralt{#1}}
\def\@authoralt{\@latex@error{No \noexpand\author* given}\@ehc}
%\@onlypreamble{\author}

%% 학번
\def\studentnumber#1{\gdef\@snu@studentnumber{#1}}
\def\@snu@studentnumber{\@latex@error{No \noexpand\studentnumber given}\@ehc}
%\@onlypreamble{\studentnumber}

%% 지도교수
\def\advisor{\@ifstar\@snu@advisoralt\@snu@advisor}
\def\@snu@advisoralt#1{\gdef\@advisoralt{#1}}
\def\@snu@advisor#1{\gdef\@advisor{#1}}
\def\@advisoralt{\@latex@error{No \noexpand\advisor* given}\@ehc}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}
%\@onlypreamble{\advisor}

%% 학위 수여일 - 표자에 들어감
\def\graddate#1{\gdef\@snu@graddate{#1}}
\def\@snu@graddate{\@latex@error{No \noexpand\graddate given}\@ehc}
%\@onlypreamble{\graddate}

%% 논문 제출일 - 인준지에 들어감 (학사 제외)
\def\submissiondate#1{\gdef\@snu@submissiondate{#1}}
\def\@snu@submissiondate{\@latex@error{No \noexpand\submissiondate given}\@ehc}
%\@onlypreamble{\submissiondate}

%% 논문 인준일 - 인준지에 들어감
\def\approvaldate#1{\gdef\@snu@approvaldate{#1}}
\def\@snu@approvaldate{\@latex@error{No \noexpand\approvaldate given}\@ehc}
%\@onlypreamble{\approvaldate}

%% Copied def. of \cleardoublepage from memoir.cls
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  %\hbox{}\thispagestyle{cleared}%
  \hbox{}\thispagestyle{empty}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% 표지
%% 표지 하단 여백은 3 cm (5 mm 작음)
%% 표지 좌우 여백은 2 cm (5 mm 작음)
%% 제목의 linespread 1.3
\newlength{\@snu@covertextheight}
\setlength{\@snu@covertextheight}{\textheight}
\addtolength{\@snu@covertextheight}{5mm}
\newcommand{\makefrontcover}{%
	%% 여백 재조정
	\cleardoublepage
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{5mm}
	\thispagestyle{empty}
	\noindent
%	\begin{minipage}[][\@snu@covertextheight][s]{\textwidth}
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\if@snu@under % 학부
			\fontsize{16pt}{16pt}\selectfont
			공학학사학위논문\\
			\vspace{2cm}\nointerlineskip
			\fontsize{21pt}{21pt}\selectfont
			\@title\\
			\vfill
			\fontsize{16pt}{16pt}\selectfont
			\@snu@graddate\\
			\vspace{4cm}\nointerlineskip
			서울대학교~공과대학\\
			\vspace{1cm}\nointerlineskip
			전기공학부\\
			\vspace{1cm}\nointerlineskip
			\@authoralt
		\else % 대학원
			\fontsize{14pt}{14pt}\selectfont
			\if@snu@ms
				\@snu@koen{공학석사학위논문}%
				{M.S. THESIS}\\
			\else
				\@snu@koen{공학박사학위논문}%
				{Ph.D. DISSERTATION}\\
			\fi
			\vspace{2cm}\nointerlineskip
			\fontsize{22pt}{22pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@titlealt\\
			\if@snu@ko\else
				\vspace{2cm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				BY\\
				\vspace{1cm}\nointerlineskip
				\@author
			\fi
			\vfill
			\fontsize{14pt}{14pt}\selectfont
			\@snu@graddate\\
			\vspace{4cm}\nointerlineskip
			\if@snu@ko
				\fontsize{16pt}{16pt}\selectfont
				서울대학교 대학원\\
				\vspace{5mm}\nointerlineskip
				\fontsize{14pt}{16pt}\selectfont
				전기 컴퓨터 공학부\\
				\vspace{5mm}\nointerlineskip
				\fontsize{16pt}{16pt}\selectfont
				\@authoralt
			\else
				\fontsize{14pt}{14pt}\selectfont
				DEPARTMENT OF ELECTRICAL ENGINEERING AND\\
				COMPUTER SCIENCE\\
				COLLEGE OF ENGINEERING\\
				SEOUL NATIONAL UNIVERSITY
			\fi
		\fi
	}
%	\end{minipage}
	%% 여백 원래대로
	\newpage
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
%% minipage와 parbox 중 무엇이 더 나은지 테스트 중.
}

%% 인준지
%% 인준지 하단 여백 2 cm (15 mm 작음)
\newlength{\@snu@approvaltextheight}
\setlength{\@snu@approvaltextheight}{\textheight}
\addtolength{\@snu@approvaltextheight}{15mm}
\newcommand{\makeapproval}{
	\cleardoublepage
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{15mm}
	\thispagestyle{empty}
	\noindent
%	\begin{minipage}[][\textheight][s]{\textwidth}
	\parbox[][\@snu@approvaltextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\if@snu@under % 학부
			\fontsize{21pt}{21pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			지도교수~\@advisoralt\\
			\vspace{1cm}\nointerlineskip
			이~논문을~공학~학사학위~논문으로~제출함\\
			%\@snu@submissiondate\\
			\vspace{5cm}\nointerlineskip
			서울대학교~공과대학\\
			\vspace{1cm}\nointerlineskip
			전기공학부\\
			\vspace{0.5cm}\nointerlineskip
			\@authoralt\\
			\vfill
			\@author~의~학사~학위~논문을~인준함\\
			\vspace{1cm}\nointerlineskip
			\@snu@approvaldate\\
			\vspace{1cm}\nointerlineskip
			지~도~교~수~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(인)
		\else % 대학원
			\fontsize{\if@snu@ko 22pt \else 16pt \fi}%
			{22pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@titlealt\\
			\vspace{1cm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			지도교수 \@advisoralt\\
			\vspace{5mm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			이 논문을 %
			공학\@snu@msphd{석사}{박사} %
			학위논문으로 제출함\\
			\vspace{5mm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			\@snu@submissiondate\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			서울대학교 대학원\\
			\vspace{5mm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			전기 컴퓨터 공학부\\
			\vspace{5mm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@authoralt\\
			\vspace{1cm}\nointerlineskip
			\@author의 %
			공학\@snu@msphd{석사}{박사} %
			학위논문을 인준함\\
			\vspace{5mm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			\@snu@approvaldate\\
			\vfill
			%위~원~장~:~\underline{~~~~~~~~~~~~~~~~~~~~~~}\\
			%부위원장~:~\underline{~~~~~~~~~~~~~~~~~~~~~~}\\
			%위~~~~원~:~\underline{~~~~~~~~~~~~~~~~~~~~~~}\\
			%\if@snu@ms\else
			%위~~~~원~:~\underline{~~~~~~~~~~~~~~~~~~~~~~}\\
			%위~~~~원~:~\underline{~~~~~~~~~~~~~~~~~~~~~~}\\
			%\fi
			\newcommand{\@snu@nameline}{\underline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}
			\begin{tabular}[b]{cc}
			위 \hfill 원 \hfill 장 & \@snu@nameline\\
			부위원장 & \@snu@nameline\\
			위 \hfill 원 & \@snu@nameline\\
			\if@snu@ms\else
			위 \hfill 원 & \@snu@nameline\\
			위 \hfill 원 & \@snu@nameline\\
			\fi
			\end{tabular}
		\fi
	}
%	\end{minipage}
	\newpage
	\if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
%% minipage와 parbox 중 무엇이 더 나은지 테스트 중.
}



%%\newcommand{\@lastPage}{\pageref{paperlastpagelabel}}

%% keyword
\newcommand{\@snu@keyword}{}
\newcommand{\keyword}[1]{\renewcommand{\@snu@keyword}{#1}}

\def\phantomsection{}

%% abstract
\renewenvironment{abstract}{%
	\if@snu@ko
		\chapter*{\abstractname}
		\@mkboth{\MakeUppercase\abstractname}%
			{\MakeUppercase\abstractname}%
		\addcontentsline{toc}{chapter}{\abstractname}%
	\else
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\abstractname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{22pt}{22pt}\selectfont
			\textbf{\abstractname}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordname}:~\@snu@keyword
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbername}:~\@snu@studentnumber
	\fi
	\newpage
	%%\@snu@changepagenumbering
}

%% keywordalt
\newcommand{\@snu@keywordalt}{}
\newcommand{\keywordalt}[1]{\renewcommand{\@snu@keywordalt}{#1}}

%% abstractalt
\newenvironment{abstractalt}%
{%
	\if@snu@ko
		\chapter*{\abstractnamealt}
		\@mkboth{\MakeUppercase\abstractnamealt}%
			{\MakeUppercase\abstractnamealt}%
		\addcontentsline{toc}{chapter}{\abstractnamealt}%
	\else
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\abstractnamealt}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\abstractnamealt}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordnamealt}:~\@snu@keywordalt
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbernamealt}:~\@snu@studentnumber
	\fi
  	\newpage
}

%% 감사의 글
\newcommand{\acknowledgement}{%
	\if@snu@ko
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\acknowledgementname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\acknowledgementname}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\else
		\chapter*{\acknowledgementname}
		\@mkboth{\MakeUppercase\acknowledgementname}%
			{\MakeUppercase\acknowledgementname}%
		\addcontentsline{toc}{chapter}{\acknowledgementname}%
	\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 캡션 스타일
%% 캡션에서 colon(:)을 제거해야 한다.
%% report 클래스에서 베끼고 :만 지움.
%% 정렬은 알아서 됨.
%% TODO
%% caption의 마지막에 마침표가 있는지 체크
%% 표의 캡션에는 마침표가 없어야 하고
%% 그림의 캡션에는 있어야 함.
%% (반대던가??)
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% 한글 논문과 영문 논문의 서식이 다르다.
% 귀찮지만 따로 만들어야 한다.
\if@snu@ko
    %% report 클래스에서 약간 고침
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      {%
	\centering
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% report 클래스에서 약간 고침
    %% chapter style
    \def\@makechapterhead#1{%
      {%
	\centering
	\normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{16pt}{16pt}\selectfont
	    \bfseries 제\space\thechapter\space장\space
	\fi
	\interlinepenalty\@M
	\fontsize{16pt}{16pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\else
    %% report 클래스에서 약간 고침
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      \vspace*{3cm}% 챕터 숫자 위의 공간
      \vspace{-\f@baselineskip} % 정확한 조절을 위해 필요
      {%
	\parindent \z@ \raggedright
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% report 클래스에서 약간 고침
    %% chapter style
    \def\@makechapterhead#1{%
      \vspace*{3cm}% 챕터 숫자 위의 공간
      \vspace{-\f@baselineskip} % 정확한 조절을 위해 필요
      {%
	\parindent \z@ \raggedright \normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{20pt}{20pt}\selectfont
	    \bfseries \@chapapp\space \thechapter
	    \par\nobreak
	    \vspace{2cm}
	\fi
	\interlinepenalty\@M
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\fi

% section style
\renewcommand\section{%
	\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\fontsize{14pt}{14pt}\selectfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\fontsize{12pt}{12pt}\selectfont\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% template과 직접적인 관련이 없는 설정으로 이것저것 대신 해준다.

\if@snu@easy
	% 이것은 KLDP에서 가져왔다.
	% http://faq.ktug.or.kr/faq/pdflatex%B0%FAlatex%B5%BF%BD%C3%BB%E7%BF%EB
	\ifpdf
		\input glyphtounicode\pdfgentounicode=1 %type 1 font사용시
		% \usepackage{dhucs-cmap} % true type 글꼴 사용시
		% \pdfmapfile{+unttf-pdftex-dhucs.map} % truetype글꼴사용시
		\usepackage[pdftex,unicode]{hyperref}
		\usepackage[pdftex]{graphicx}
		\usepackage[pdftex,svgnames]{xcolor}
	\else
		\usepackage[dvipdfmx,unicode]{hyperref}
		\usepackage[dvipdfmx]{graphicx}
		\usepackage[dvipdfmx,svgnames]{xcolor}
	\fi
	%KC2008의 공식예제인 first.tex와 ko.TEX v0.1.0 사용 설명서 참조
	%hangul-ucs 4.0 이전 버전에서는 dhucs-ucshyper라는 부가 패키지가 제공되었으나, 
	%hyperref의 기능 향상에 따라 불필요해졌으므로 
	%ko.TEX에서는 이를 제공하지 않는다.
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 역사를 보존하는 의미에서 오래된 저작 정보를 남겨둔다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% jdj의 저작 정보는 다음과 같다.
%%%%%다음%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% SNU EE 학사 논문 서식
%% KAIST것을 복사해다 조금 고쳐서 만듦.
%% 구할 수 있는 유일한 것이 KAIST것이었기 때문.
%% KC2007에서 컴파일 되는 것을 확인함.
%% ... modified by jdj, to ko.tex
%% ... stripped down redundent codes
%% ... modified margins.
%%
%% @version		0.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% KAIST 템플릿의 저작 정보는 다음과 같다.
%%%%%다음%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% KAIST Thesis Template for LaTeX
%%
%% @version      0.4
%% @releasedate  Nov 12th, 2004
%%
%% @author       Chae, Seugbyung 채승병
%%               mailto:chess@kaist.ac.kr
%%
%% @requirements
%%    current distribution of teTeX, fpTeX, MikTeX
%%		+ Hangul-ucs 2.6.0 or higher
%%	  (please see http://faq.ktug.or.kr/faq/Hangul-ucs)
%%
%% Karnes Kim, converted to Hangul-ucs version.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

