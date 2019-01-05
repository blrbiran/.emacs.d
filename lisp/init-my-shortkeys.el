;; My short-keys

;; 1.1 用C-z C-z快速插入"CR-Id: "。
(defun bi-insert-CR-word()
  (interactive)
  (insert "CR-Id: ")
  (end-of-line))

(defun bi-insert-defined-CR-word(cr-type)
  (interactive "MInput an CR type:")
  (insert (format "%s CR-Id: " cr-type))
  (end-of-line))


(global-set-key "\C-z\C-zi" 'bi-insert-CR-word)
(global-set-key "\C-z\C-zw" 'bi-insert-defined-CR-word)

;; 1.2 用C-z C-x显示16进制的2进制值并复制到剪贴板
(defun bi-number-to-bin-string (number)
  (require 'calculator)
  (let ((calculator-output-radix 'bin)
        (calculator-radix-grouping-mode nil))
    (calculator-number-to-string number)))

(defun bi-what-hexadecimal-value ()
  "Prints the decimal value of a hexadecimal string under cursor.
Samples of valid input:

  ffff
  0xffff
  #xffff
  FFFF
  0xFFFF
  #xFFFF

Test cases
  64*0xc8+#x12c 190*0x1f4+#x258
  100 200 300   400 500 600"
  (interactive)

  (let (inputStr tempStr binStr p1 p2)
    (save-excursion
      (re-search-backward "[^0-9A-Fa-fx#]" nil t)
      (forward-char)
      (setq p1 (point))
      (re-search-forward "[^0-9A-Fa-fx#]" nil t)
      (backward-char)
      (setq p2 (point))
      )

    (setq inputStr (buffer-substring-no-properties p1 p2))

    (let ((case-fold-search nil))
      (setq tempStr (replace-regexp-in-string "^0x" "" inputStr)) ; C, Perl, …
      (setq tempStr (replace-regexp-in-string "^#x" "" tempStr)) ; elisp …
      (setq tempStr (replace-regexp-in-string "^#" "" tempStr))  ; CSS …
      )

    (setq binStr (bi-number-to-bin-string (string-to-number tempStr 16)))
    (message "Hex %s is %s" tempStr binStr)
    (with-temp-buffer
      (insert binStr)
      (clipboard-kill-region (point-min) (point-max)))
    ))


(global-set-key "\C-z\C-x" 'bi-what-hexadecimal-value)

(provide 'init-my-shortkeys)
