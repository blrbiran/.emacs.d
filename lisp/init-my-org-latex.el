;; How to highlight source code see: http://joat-programmer.blogspot.de/2013/07/org-mode-version-8-and-pdf-export-with.html
;; How to set options for minted package see: http://orgmode.org/worg/org-tutorials/org-latex-export.html
;; Detail settings about minted package see: http://mirror.unl.edu/ctan/macros/latex/contrib/minted/minted.pdf
;;special settings for Org-Latex
;; Include the latex-exporter
(require 'ox-latex)
;; Add minted to the defaults packages to include when exporting.
(add-to-list 'org-latex-packages-alist '("" "minted"))
;; Tell the latex export to use the minted package for source
;; code coloration.
(setq org-latex-listings 'minted)
;; Let the exporter use the -shell-escape option to let latex
;; execute external programs.
;; This obviously and can be dangerous to activate!
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide 'init-my-org-latex)
