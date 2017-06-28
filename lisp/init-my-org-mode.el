;;special settings for Org-Mode
;; show highlight while edit (#+begin_src .. #end_src)
(setq org-src-fontify-natively t)

;; set auto lines
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;set for calendar Date
;(add-hook 'org-mode-hook
;          (lambda ()
;            (set (make-local-variable 'system-time-locale) "ENU")))
;            (set (make-local-variable 'system-time-locale) "CHS")))

;; 设置语言为英语
(add-hook 'org-mode-hook
          (lambda ()
            (set-locale-environment "ENU")))
;           (set-locale-environment "CHS")))

(add-hook 'org-mode-hook
          (lambda ()
            (setq system-time-locale "C")))


;; enable run with python... src code in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (C . t)
   ))

(provide 'init-my-org-mode)
