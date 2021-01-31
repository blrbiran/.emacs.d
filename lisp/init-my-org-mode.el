;; Special settings for Org-Mode
;; show highlight while edit (#+begin_src .. #end_src)
(setq org-src-fontify-natively t)

;; set auto lines
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)
						   (setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
													  (?B . (:foreground "yellow"))
													  (?C . (:foreground "green"))))))

;;set for calendar Date
;;(add-hook 'org-mode-hook
;;          (lambda ()
;;            (set (make-local-variable 'system-time-locale) "ENU")))
;;            (set (make-local-variable 'system-time-locale) "CHS")))

;; if using Mac os X, need set "export LANG=en_US.UTF-8" in ~/.zshrc or ~/.bash_profile

;; 设置语言为英语
(add-hook 'org-mode-hook
		  (lambda ()
			(setq system-time-locale "C")))

(add-hook 'org-mode-hook
		  (lambda ()
			(set-locale-environment "ENU")))
            ;; (set-locale-environment "CHS")))



;; enable run with python... src code in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   ;;   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (C . t)
   (plantuml . t)))

;; Using PlantUML for emacs draw UML
;; site: https://www.cnblogs.com/yangwen0228/p/6825560.html
;; site: http://plantuml.com/
(setq org-plantuml-jar-path
	  (expand-file-name "~/.emacs.d/module/plantuml/plantuml.jar"))

(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md))

(provide 'init-my-org-mode)
