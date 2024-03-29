;; Evil Settings

;; Enable evil
(setq evil-toggle-key "C-q") ; remove default evil-toggle-key C-z, C-q to replace it.
(setq evil-want-C-i-jump nil)  ; don't bind [tab] to evil-jump-forward
(require 'evil)

;; Enable evil-leader
(require 'evil-leader)
(global-evil-leader-mode)

;; Using Space as a prefix key
(evil-leader/set-leader "<SPC>")

;; Bind several keys at once
(evil-leader/set-key
  "e" 'find-file
  "s" 'save-buffer
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; Beginning with version 0.3 evil-leader has support for mode-local bindings:
(evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)

;; Enable evil
(evil-mode 1)

;; Remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)

;; ESC to switch back normal-state
(define-key evil-insert-state-map (kbd "C-M-j") 'evil-normal-state)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; TAB to indent in normal-state
;(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
;; Enable tab in org-mode with evil normal mode
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(provide 'init-my-evil)
