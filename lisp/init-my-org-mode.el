;;special settings for Org-Mode
;; show highlight while edit (#+begin_src .. #end_src)
(setq org-src-fontify-natively t)

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

(provide 'init-my-org-mode)
