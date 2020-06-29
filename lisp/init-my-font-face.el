(require 'whitespace)
;(setq whitespace-style '(face empty space tabs lines-tail trailing))
(setq whitespace-style '(face empty tabs lines-tail trailing indentation::tab))
(global-whitespace-mode t)
;; (custom-set-faces
;;    '(my-tab-face            ((((class color)) (:background "grey10"))) t)
;;    '(my-trailing-space-face ((((class color)) (:background "red10"))) t)
;;    '(my-long-line-face ((((class color)) (:background "gray10"))) t))
;; (add-hook 'font-lock-mode-hook
;;             (function
;;              (lambda ()
;;                (setq font-lock-keywords
;;                      (append font-lock-keywords
;;                              '(("\t+" (0 'my-tab-face t))
;;                                ("^.\\{81,\\}$" (0 'my-long-line-face t))
;;                                ("[ \t]+$"      (0 'my-trailing-space-face t))))))))

(provide 'init-my-font-face)
