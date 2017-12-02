;; Enable evil
(setq evil-toggle-key "C-q")	; remove default evil-toggle-key C-z, C-q to replace it.
(setq evil-want-C-i-jump nil)	; don't bind [tab] to evil-jump-forward
(require 'evil)
(evil-mode 1)
    
;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)
    
;; ESC to switch back normal-state
(define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)
    
;; TAB to indent in normal-state
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
    
;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(provide 'init-evil)
