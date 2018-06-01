;; My short-keys

;; 1.1 用C-z C-r快速插入"CR-Id: "。
(defun bi-insert-CR-word()
  (interactive)
  (insert "CR-Id: ")
  (end-of-line))

(defun bi-insert-defined-CR-word(cr-type)
  (interactive "MInput an CR type:")
  (insert (format "%s CR-Id: " cr-type))
  (end-of-line))


(global-set-key "\C-z\C-ri" 'bi-insert-CR-word)
(global-set-key "\C-z\C-rw" 'bi-insert-defined-CR-word)

(provide 'init-my-shortkeys)
