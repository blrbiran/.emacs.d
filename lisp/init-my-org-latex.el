;; How to highlight source code see: http://joat-programmer.blogspot.de/2013/07/org-mode-version-8-and-pdf-export-with.html
;; How to set options for minted package see: http://orgmode.org/worg/org-tutorials/org-latex-export.html
;; Detail settings about minted package see: http://mirror.unl.edu/ctan/macros/latex/contrib/minted/minted.pdf
;;special settings for Org-Latex
;; Include the latex-exporter
(require 'ox-latex)

;; Add minted to the defaults packages to include when exporting.
;(add-to-list 'org-latex-packages-alist '("" "minted"))
;; Tell the latex export to use the minted package for source
;; code coloration.
;(setq org-latex-listings 'minted)

;; Let the exporter use the -shell-escape option to let latex
;; execute external programs.
;; This obviously and can be dangerous to activate!
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; export with latex part
(setq org-export-with-LaTeX-fragments t)

;; org latex size
(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)) 

;;org-export latex
(add-to-list 'org-latex-classes
'("org-article"
"\\documentclass[11pt,a4paper]{article}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{latexsym,amssymb,amsmath}
\\usepackage{listings}
\\usepackage{marvosym}
\\usepackage{textcomp}
\\usepackage{hyperref}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{geometry}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(provide 'init-my-org-latex)
