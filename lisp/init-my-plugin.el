;; (require 'package)
;; (add-to-list 'package-archives
;;       '("melpa" . "http://melpa.org/packages/"))
;; (when (< emacs-major-version 24)
;;  ;; For important compatibility libraries like cl-lib
;;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; (package-initialize)
;; (when (not package-archive-contents)
;;  (package-refresh-contents))

(require 'init-my-elpa)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install packages
(let ((myPackages-plugin
       '(smex                 ;; ido in M-x
         company              ;; auto completition
         find-file-in-project ;; find file in project
         flymake              ;; code check
         ace-jump-mode        ;; easy jump in document
         markdown-mode        ;; highlight for markdown, etc.
         which-key            ;; which-key-mode
         linum-relative       ;; show relative line number
         evil                 ;; vim operate method
         evil-leader          ;; vim leader function
         org
         org-roam             ;; org note
         spacemacs-theme ;; spacemacs theme
         )))
  (mapc (lambda (go-package)
          (unless (package-installed-p go-package)
            (package-install go-package))) myPackages-plugin))

;; Settings for plugin

;; Smex
;; https://www.emacswiki.org/emacs/Smex
(global-set-key [(meta x)]
                (lambda ()
                  (interactive)
                  (or (boundp 'smex-cache)
                      (smex-initialize))
                  (global-set-key [(meta x)] 'smex)
                  (smex)))

(global-set-key [(shift meta x)]
                (lambda ()
                  (interactive)
                  (or (boundp 'smex-cache)
                      (smex-initialize))
                  (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                  (smex-major-mode-commands)))

;; Hyphen on Space (use "-" replace " ", like normal M-x)
(defadvice smex (around space-inserts-hyphen activate compile)
  (let ((ido-cannot-complete-command `(lambda ()
                                        (interactive)
                                        (if (string= " " (this-command-keys))
                                            (insert ?-)
                                          (funcall ,ido-cannot-complete-command))))) ad-do-it))

;; I don’t like to have smex update every time I run (auto-update is usually good enough, and is noticeably faster). But it’s annoying when I manually load a file and the new commands are not in smex. So I add a smex-update to after-load-functions.
(defun smex-update-after-load (unused)
  (when (boundp 'smex-cache)
    (smex-update)))
(add-hook 'after-load-functions 'smex-update-after-load)

;; Using acronyms
;; e.g. without this code the completion of ‘ffow’ shows:
;; { ediff-show-registry | Buffer-menu-1-window | Buffer-menu-2-window ...
;; with:
;; { find-file-other-window | find-function-other-window | ediff-show-registry ...
(defadvice ido-set-matches-1 (around ido-smex-acronym-matches activate)
  "Filters ITEMS by setting acronynms first."
  (if (and (fboundp 'smex-already-running)
           (smex-already-running)
           (> (length ido-text) 1))

      ;; We use a hash table for the matches, <type> => <list of items>, where
      ;; <type> can be one of (e.g. `ido-text' is "ff"):
      ;; - strict: strict acronym match (i.e. "^f[^-]*-f[^-]*$");
      ;; - relaxed: for relaxed match (i.e. "^f[^-]*-f[^-]*");
      ;; - start: the text start with (i.e. "^ff.*");
      ;; - contains: the text contains (i.e. ".*ff.*");
      (let ((regex (concat "^" (mapconcat 'char-to-string ido-text "[^-]*-")))
            (matches (make-hash-table :test 'eq)))

        ;; Filtering
        (dolist (item items)
          (let ((key))
            (cond
             ;; strict match
             ((string-match (concat regex "[^-]*$") item)
              (setq key 'strict))

             ;; relaxed match
             ((string-match regex item)
              (setq key 'relaxed))

             ;; text that start with ido-text
             ((string-match (concat "^" ido-text) item)
              (setq key 'start))

             ;; text that contains ido-text
             ((string-match ido-text item)
              (setq key 'contains)))
            (when key
              ;; We have a winner! Update its list.
              (let ((list (gethash key matches ())))
                (puthash key (push item list) matches)))))

        ;; Finally, we can order and return the results
        (setq ad-return-value (append (gethash 'strict matches)
                                      (gethash 'relaxed matches)
                                      (gethash 'start matches)
                                      (gethash 'contains matches))))

    ;; ...else, run the original ido-set-matches-1
    ad-do-it))

;; find-file-in-project
;; https://github.com/technomancy/find-file-in-project

(setq ffip-project-root "~/code/project")

;; M-x find-file-in-project
;; M-x find-file-in-project-by-selected
;; M-x find-file-with-similar-name
;; M-x find-directory-in-project-by-selected
;; M-x ffip-create-project-file
;; M-x find-file-in-current-directory
;; M-x find-file-in-current-directory-by-selected
;; M-x ffip-show-diff-by-description or M-x ffip-show-diff
;; M-x ffip-save-ivy-last and M-x ffip-ivy-resume
;; M-x find-relative-path
;; M-x ffip-diff-apply-hunk


;; ace-jump-mode

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; C-c SPC: find Char (as Initial of word)
;; C-u C-c SPC: find Char
;; C-u C-u C-c SPC: find Line


;; git-emacs
;;git clone https://github.com/tsgates/git-emacs.git
(add-to-list 'load-path "~/.emacs.d/git-emacs/")
(require 'git-emacs)


;; which-key-mode
(require 'which-key)
(which-key-mode t)


;; linum-relative
;; M-x package-install linum-relative
(global-linum-mode t)
;(global-display-line-numbers-mode t)
(require 'linum-relative)
(setq linum-relative-backend 'display-line-numbers-mode)
(linum-relative-global-mode t)
;; C-c l: linum-relative toggle
(define-key global-map (kbd "C-c l") 'linum-relative-toggle)

(provide 'init-my-plugin)
