\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ficheseance}[2026/10/19 v1.1.0-dev Classe pour fiche de séance d'entraînement]

% 1. Transmission de toutes les options utilisateur vers la classe de base article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% 2. Chargement des options par défaut (A4, paysage, 10pt)
\PassOptionsToClass{a4paper, landscape, 10pt}{article}

% 3. Traitement des options de l'utilisateur (qui surchargeront les options par défaut si spécifiées)
\ProcessOptions\relax

% 4. Chargement de la classe article
\LoadClass{article}

% 5. Gestion des marges de la page
\RequirePackage{geometry}
\geometry{
	hmargin=1.5cm, % Marges gauche et droite
	vmargin=1.5cm  % Marges haut et bas
}

% 6. Paquets pour la gestion des couleurs et des tableaux
\RequirePackage[table]{xcolor}
\RequirePackage{xltabular}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{translations}
\RequirePackage{iftex}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% 6a. Configuration des polices selon le moteur de compilation
\iftutex
  % Si LuaLaTeX ou XeLaTeX
  \RequirePackage{fontspec}
\else
  % Si pdfLaTeX
  \RequirePackage[T1]{fontenc}
\fi

% Configuration globale des listes pour supprimer la marge parasite dans les tableaux
\setlist[itemize]{nosep, left=0pt}

% 6b. Dictionnaire des traductions (Internationalisation)
\DeclareTranslationFallback{Fiche-Title}{Fiche de séance}
\DeclareTranslation{French}{Fiche-Title}{Fiche de séance}
\DeclareTranslation{English}{Fiche-Title}{Training Session Sheet}

\DeclareTranslationFallback{Fiche-Num}{Fiche n$^\circ$ :}
\DeclareTranslation{French}{Fiche-Num}{Fiche n$^\circ$ :}
\DeclareTranslation{English}{Fiche-Num}{Session Sheet n$^\circ$ :}

\DeclareTranslationFallback{Fiche-Date}{Date :}
\DeclareTranslation{French}{Fiche-Date}{Date :}
\DeclareTranslation{English}{Fiche-Date}{Date :}

\DeclareTranslationFallback{Fiche-Archer}{Nom de l'archer / groupe :}
\DeclareTranslation{French}{Fiche-Archer}{Nom de l'archer / groupe :}
\DeclareTranslation{English}{Fiche-Archer}{Archer's Name / Group :}

\DeclareTranslationFallback{Fiche-Theme}{Thème :}
\DeclareTranslation{French}{Fiche-Theme}{Thème :}
\DeclareTranslation{English}{Fiche-Theme}{Topic :}

\DeclareTranslationFallback{Fiche-ObjSeance}{Objectif de séance :}
\DeclareTranslation{French}{Fiche-ObjSeance}{Objectif de séance :}
\DeclareTranslation{English}{Fiche-ObjSeance}{Session Objective :}

\DeclareTranslationFallback{Col-Obj}{Objectif}
\DeclareTranslation{French}{Col-Obj}{Objectif}
\DeclareTranslation{English}{Col-Obj}{Goal}

\DeclareTranslationFallback{Col-Time}{Temps}
\DeclareTranslation{French}{Col-Time}{Temps}
\DeclareTranslation{English}{Col-Time}{Time}

\DeclareTranslationFallback{Col-Sit}{Situations}
\DeclareTranslation{French}{Col-Sit}{Situations}
\DeclareTranslation{English}{Col-Sit}{Situations}

\DeclareTranslationFallback{Col-Tools}{Outils}
\DeclareTranslation{French}{Col-Tools}{Outils}
\DeclareTranslation{English}{Col-Tools}{Tools}

\DeclareTranslationFallback{Col-Cons}{Consignes}
\DeclareTranslation{French}{Col-Cons}{Consignes}
\DeclareTranslation{English}{Col-Cons}{Instructions}

\DeclareTranslationFallback{Col-Crit}{Critères de réussite}
\DeclareTranslation{French}{Col-Crit}{Critères de réussite}
\DeclareTranslation{English}{Col-Crit}{Success criteria}

\DeclareTranslationFallback{Col-Eval}{Évaluations}
\DeclareTranslation{French}{Col-Eval}{Évaluations}
\DeclareTranslation{English}{Col-Eval}{Evaluation}

\DeclareTranslationFallback{Col-Obj-Sub}{l'archer doit être capable de}
\DeclareTranslation{French}{Col-Obj-Sub}{l'archer doit être capable de}
\DeclareTranslation{English}{Col-Obj-Sub}{Archer must be able to}

\DeclareTranslationFallback{Col-Sit-Sub}{distance, aménagement, volume}
\DeclareTranslation{French}{Col-Sit-Sub}{distance, aménagement, volume}
\DeclareTranslation{English}{Col-Sit-Sub}{Drill, Setup, Volume}

\DeclareTranslationFallback{Col-Eval-Sub}{Critères d'observation}
\DeclareTranslation{French}{Col-Eval-Sub}{Critères d'observation}
\DeclareTranslation{English}{Col-Eval-Sub}{Observation criteria}

\DeclareTranslationFallback{Fiche-Page}{Page}
\DeclareTranslation{French}{Fiche-Page}{Page}
\DeclareTranslation{English}{Fiche-Page}{Page}

\DeclareTranslationFallback{Fiche-Sur}{sur}
\DeclareTranslation{French}{Fiche-Sur}{sur}
\DeclareTranslation{English}{Fiche-Sur}{of}

% 7. Définition des types de colonnes personnalisés
% Colonne X centrée verticalement pour un rendu propre
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}

% 8. Environnement de tableau personnalisé pour la séance
\newenvironment{tableauSeance}{%
	\xltabular{\textwidth}{|Y|p{1.2cm}|Y|p{2cm}|Y|Y|Y|}
	\hline
	\rowcolor{gray!20}
	\textbf{\GetTranslation{Col-Obj}} & \textbf{\GetTranslation{Col-Time}} & \textbf{\GetTranslation{Col-Sit}} & \textbf{\GetTranslation{Col-Tools}} & \textbf{\GetTranslation{Col-Cons}} & \textbf{\GetTranslation{Col-Crit}} & \textbf{\GetTranslation{Col-Eval}} \\
	\rowcolor{gray!20}
	{\tiny \GetTranslation{Col-Obj-Sub}} & & {\tiny \GetTranslation{Col-Sit-Sub}} & & & & {\tiny \GetTranslation{Col-Eval-Sub}} \\
	\hline
	\endhead
}{%
	\endxltabular
}

% 9. Définition des variables de la fiche
\newcommand{\@numfiche}{}%
\newcommand{\numfiche}[1]{\renewcommand{\@numfiche}{#1}}

\newcommand{\@datefiche}{}%
\newcommand{\datefiche}[1]{\renewcommand{\@datefiche}{#1}}

\newcommand{\@archer}{}%
\newcommand{\archer}[1]{\renewcommand{\@archer}{#1}}

\newcommand{\@theme}{}%
\newcommand{\theme}[1]{\renewcommand{\@theme}{#1}}

\newcommand{\@objectifseance}{}%
\newcommand{\objectifseance}[1]{\renewcommand{\@objectifseance}{#1}}

% 10. Commande pour afficher le cartouche d'en-tête
\newcommand{\makeficheheader}{%
	\thispagestyle{firstpage} % Style épuré pour la première page
	\noindent
	\begin{tabularx}{\textwidth}{|l X|l X|}
		\hline
		\multicolumn{2}{|l|}{\textbf{\Large \GetTranslation{Fiche-Title}}} & \textbf{\GetTranslation{Fiche-Num}} & \@numfiche \\
		\hline
		\textbf{\GetTranslation{Fiche-Date}} & \@datefiche & \textbf{\GetTranslation{Fiche-Archer}} & \@archer \\
		\hline
		\textbf{\GetTranslation{Fiche-Theme}} & \multicolumn{3}{l|}{\@theme} \\
		\hline
		\textbf{\GetTranslation{Fiche-ObjSeance}} & \multicolumn{3}{l|}{\@objectifseance} \\
		\hline
	\end{tabularx}
	\vspace{0.5cm} % Espace entre l'en-tête et le grand tableau
}

% 11. Gestion du français par défaut (si aucun gestionnaire de langue n'est chargé)
\AtBeginDocument{%
	\@ifpackageloaded{babel}{%
		% Si babel est chargé, on s'assure de la compatibilité avec nos tableaux
		\makeatletter
		\@ifundefined{frenchbsetup}{}{%
			% Force babel-french à respecter les réglages de listes d'enumitem et non les siens
			\frenchbsetup{StandardItemizeEnv=true}
		}%
		\makeatother
	}{%
		% Si ni babel ni polyglossia ne sont chargés, le système est en "english" par défaut.
		% Le package translations se cale sur \@trnslt@language ou \languagename.
		\@ifpackageloaded{polyglossia}{}{%
			\makeatletter
			\def\languagename{french}%
			\def\@trnslt@language{french}%
			\makeatother
		}
	}%
}

% 12. Configuration des En-têtes et Pieds de page (fancyhdr)
\fancypagestyle{fancy}{
	\fancyhf{} % Vide tout par défaut
	\renewcommand{\headrulewidth}{0pt} % Pas de ligne en haut
	\renewcommand{\footrulewidth}{0.4pt} % Ligne fine en bas
	\fancyfoot[L]{\GetTranslation{Fiche-Num} \@numfiche}
	\fancyfoot[C]{\@theme}
	\fancyfoot[R]{\GetTranslation{Fiche-Page} \thepage{} \GetTranslation{Fiche-Sur} \pageref{LastPage}}
}

% Style épuré pour la page 1 (les infos sont déjà dans le cartouche d'en-tête)
\fancypagestyle{firstpage}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0.4pt}
	\fancyfoot[L]{}
	\fancyfoot[C]{}
	\fancyfoot[R]{\GetTranslation{Fiche-Page} \thepage{} \GetTranslation{Fiche-Sur} \pageref{LastPage}}
}

% Application du style standard par défaut pour tout le document
\pagestyle{fancy}

% Commande à 7 arguments pour ajouter une situation/exercice
\newcommand{\ligneSeance}[7]{%
	#1 & #2 & #3 & #4 & #5 & #6 & #7 \\ \hline
}
