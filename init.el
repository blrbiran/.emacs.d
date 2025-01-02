;; Disable warning for using package cl
(setq byte-compile-warnings '(cl-functions))
;; Make startup faster by reducing the frequency of garbage collection.
;; The default is 0.8MB. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))
;; Portion of heap used for allocation. Defaults to 0.1.
(setq gc-cons-percentage 0.6)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (version< emacs-version "27.0")
  (package-initialize))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin) )
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)) )

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil))
  (require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el ,before package from dir "site-lisp"

  (message "Emacs load site lisp plugins in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'use-package) ;; Load use-package so that we can load other packages later
  (require 'init-my-elpa) ;; Load elpa settings

  (message "Emacs load elpa settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-plugin)

  (require 'init-color-theme)
  ;; (use-package init-color-theme :defer 1)

  (message "Emacs load color-theme settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-org-mode)
  (require 'init-my-org-agenda)
  (require 'init-my-org-latex)
  (require 'init-my-org-roam)
;  (use-package init-my-org-mode :defer 1)
;  (use-package init-my-org-agenda :defer 1)
;  (use-package init-my-org-latex :defer 1)

  (message "Emacs load org mode settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-module)

  (message "Emacs load my module settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-mysettings)

  (message "Emacs load basic settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  ;; my speak mode ; C-c C-a a to speak the buffer; C-c C-a e to interrupt
  (require 'speak-mode)

  (message "Emacs load my plugins in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  ;; (require 'init-my-python)

  (require 'init-my-language)
  (if window-system
	  (require 'init-my-font-setting) (message "This is not a window-system"))
  ;; (use-package init-my-font-setting :defer 2)

  (require 'init-my-font-face)

  (message "Emacs init font settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  ;; (require 'init-my-go)
  (use-package init-my-go :defer 20)

  (message "Emacs load go settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-c)

  (message "Emacs load c settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  ;; (require 'init-md-mode)
  ;; (require 'init-my-screen-shot)

  (require 'key-chord)

  (message "Emacs load key-chord settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-evil)

  (message "Emacs load evil settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-shortkeys)

  (message "Emacs load shortkey settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-ace-jump)

  (message "Emacs load ace-jump settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  (require 'init-my-elisp)

  (message "Emacs load my elisp settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))

  ;; (require 'ox-freemind)
  (use-package ox-freemind :defer 30)

  (message "Emacs load ox-freemind settings in %s"
		   (format "%.2f seconds"
				   (float-time (time-subtract after-init-time before-init-time))))


  ;; my personal setup, other major-mode specific setup need it.
  ;; It's dependent on init-site-lisp.el
  (if (file-exists-p "~/.custom.el") (load-file "~/.custom.el"))
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(package-selected-packages
   '(org-roam-ui org spacemacs-theme org-roam linum-relative which-key-posframe which-key company-go go-mode smex markdown-mode ggtags find-file-in-project company ace-jump-mode))
 '(safe-local-variable-values '((eval org-content 2)))
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

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (defun show-startup-time()
            (message "Emacs ready in %s"
                     (format "%.2f seconds"
                             (float-time (time-subtract after-init-time before-init-time))))))
