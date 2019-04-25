;; Golang settings

(require 'init-my-elpa)
(when (not package-archive-contents) 
  (package-refresh-contents))

;; install packages
(let ((myPackages-go '(go-mode flymake company company-go)))
  (mapc (lambda (go-package) 
          (unless (package-installed-p go-package)
            (package-install go-package)))
        myPackages-go))

;; BASIC CUSTOMIZATION
;; --------------------------------------
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda () 
                           (local-set-key (kbd "\C-c\C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook '(lambda () 
                           (local-set-key (kbd "\C-c\C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda () 
                           (local-set-key (kbd "\C-c\C-f") 'gogmt)))
(add-hook 'go-mode-hook '(lambda () 
                           (local-set-key (kbd "\C-c\C-k") 'godoc)))

;; use "go get github.com/nsf/gocode" to install gocode

;; use "go get github.com/dougm/goflymake" to install go-flymake
(add-to-list 'load-path "$GOPATH/src/github.com/dougm/goflymake")
;;(require 'go-flymake)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda () 
                          (set (make-local-variable 'company-backends) 
                               '(company-go)) 
                          (company-mode)))

(provide 'init-my-go)
