;; Installation
;;The recommended way to install markdown-mode is to install the package from MELPA Stable using package.el. First, configure package.el and the MELPA Stable repository by adding the following to your .emacs, init.el, or equivalent startup file:

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;Then, after restarting Emacs or evaluating the above statements, issue the following command: M-x package-install RET markdown-mode RET. When installed this way, the major modes markdown-mode and gfm-mode will be autoloaded and markdown-mode will be used for file names ending in either .md or .markdown.

;;Alternatively, if you manage loading packages with use-package then you can automatically install and configure markdown-mode by adding a declaration such as this one to your init file (as an example; adjust settings as desired):

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; $ sudo yum install python-markdown2 or $ sudo yum install pandoc
;; $ yum install python-markdown2 then $ ln -s /usr/bin/markdown2 /usr/local/bin/markdown
;; or (custom-set-variables '(markdown-command "/usr/local/bin/pandoc"))
;; or brew install markdown
