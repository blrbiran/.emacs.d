;; Python Settings

(require 'init-my-elpa)
(when (not package-archive-contents) 
  (package-refresh-contents))

;; install packages
(let ((myPackages-python '(ein elpy flycheck material-theme py-autopep8)))
  (mapc (lambda (python-package) 
          (unless (package-installed-p python-package) 
            (package-install python-package))) myPackages-python))


;; BASIC CUSTOMIZATION
;; --------------------------------------

(load-theme 'material t) ;; load material theme

;; PYTHON CONFIGURATION
;; --------------------------------------
(elpy-enable)
(elpy-use-ipython)
;; (elpy-use-cpython)

;; use flycheck not flymake with elpy
(when 
    (require 'flycheck nil t) 
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)) 
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ; pymacs
;; ;; (add-to-list 'load-path "~/.emacs.d/pymacs-0.25")
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")

;; ; ropemacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;; enable newline-and-indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

(provide 'init-my-python)
