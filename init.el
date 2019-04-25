;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin) )
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) 
                  (eq system-type 'linux)) )
(setq *unix* (or *linux* 
                 (eq system-type 'usg-unix-v) 
                 (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not 
                      (featurep 'xemacs)) 
                     (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond (*is-a-mac* (< (string-to-number (nth 1 (split-string
                                                                 (shell-command-to-string
                                                                  "sysctl hw.physmem"))))
                                       4000000000)) 
                        (*linux* nil) 
                        (t nil)))

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil)) 
  (require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el ,before package from dir "site-lisp"
  (require 'init-my-elpa)   ;; Load elpa settings
  (require 'init-my-org-mode) 
  (require 'init-my-org-agenda) 
  (require 'init-my-org-latex) 
  (require 'init-color-theme)
  (require 'init-my-module)
  ;; my speak mode ; C-c C-a a to speak the buffer; C-c C-a e to interrupt
  (require 'speak-mode)
  (require 'init-my-plugin) 
  (require 'init-mysettings)
  ;;  (require 'init-my-python)
  (require 'init-my-language) 
  (cond ((eq 'window-system nil) 
         (require 'init-my-font-setting)))
  ;;  (require 'init-my-font-setting)
  (require 'init-my-go) 
  (require 'init-my-c)
  ;;  (require 'init-md-mode)
  ;;  (require 'init-my-screen-shot)
  (require 'key-chord) 
  (require 'init-my-evil) 
  (require 'init-my-shortkeys) 
  (require 'init-my-ace-jump) 
  (require 'init-my-elisp)
  (require 'ox-freemind)

  ;; my personal setup, other major-mode specific setup need it.
  ;; It's dependent on init-site-lisp.el
  (if (file-exists-p "~/.custom.el") 
      (load-file "~/.custom.el")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t) 
 '(package-selected-packages (quote (company-go go-mode smex markdown-mode ggtags
                                                find-file-in-project company ace-jump-mode))) 
 '(show-paren-mode t) 
 '(tool-bar-mode nil) 
 '(truncate-partial-width-windows nil))
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
