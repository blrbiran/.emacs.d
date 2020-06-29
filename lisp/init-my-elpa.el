;; -*-Emacs-Lisp-*-

;; Use melpa
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                     (not (gnutls-available-p))))
;;        (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
;;   (add-to-list 'package-archives (cons "melpa" url) t))
;; (when (< emacs-major-version 24) For important compatibility libraries like cl-lib (add-to-list
;;                                                                                     'package-archives
;;                                                                                     '("gnu" .
;;                                                                                       "http://elpa.gnu.org/packages/")))

(setq package-archives '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(package-initialize)

(provide 'init-my-elpa)
