;;
;; ace jump mode major function
;; 
;(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
(define-key evil-normal-state-map (kbd "SPC f") 'ace-jump-mode)

;;Re-arrange shortkey order
(setq ace-jump-mode-submode-list
      '(ace-jump-char-mode              ;; the first one always map to: C-c SPC
        ace-jump-word-mode              ;; the second one always map to: C-u C-c SPC            
        ace-jump-line-mode) )           ;; the third one always map to: C-u C-u C-c SPC

(provide 'init-my-ace-jump)
