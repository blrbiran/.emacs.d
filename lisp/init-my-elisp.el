;; Emacs Lisp Settings

(require 'init-my-elpa)
(when (not package-archive-contents) 
  (package-refresh-contents))

;; install packages
(let ((myPackages-elisp '(elisp-format)))
  (mapc (lambda (elisp-package) 
          (unless (package-installed-p elisp-package) 
            (package-install elisp-package))) myPackages-elisp))

(provide 'init-my-elisp)
