(require 'package)

(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;(package-refresh-contents)

(let ((myPackages
	   '(ein
		 elpy
		 flycheck
		 material-theme
		 py-autopep8)))

  (mapc (lambda (python-package)
		  (unless (package-installed-p python-package)
			(package-install python-package)))
		myPackages))


;; BASIC CUSTOMIZATION
;; --------------------------------------

;(load-theme 'material t) ;; load material theme

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-my-python)
