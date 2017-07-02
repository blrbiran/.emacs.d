(require 'package)

(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; (package-refresh-contents)

;; Install packages
(let ((myPackages-plugin
	   '(smex ;; ido in M-x
		 company ;; auto completition
		 find-file-in-project ;; find file in project
		 flymake ;; code check
		 ace-jump-mode ;; easy jump in document
		 markdown-mode ;; highlight for markdown, etc.
		 )))


(mapc (lambda (go-package)
  (unless (package-installed-p go-package)
	(package-install go-package)))
	  myPackages-plugin))

;; Settings for plugin

;; Smex
;; https://www.emacswiki.org/emacs/Smex
(global-set-key [(meta x)] (lambda ()
							 (interactive)
							 (or (boundp 'smex-cache)
								 (smex-initialize))
							 (global-set-key [(meta x)] 'smex)
							 (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                 (interactive)
                                 (or (boundp 'smex-cache)
                                     (smex-initialize))
                                 (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                 (smex-major-mode-commands)))

; Hyphen on Space (use "-" replace " ", like normal M-x)
(defadvice smex (around space-inserts-hyphen activate compile)
      (let ((ido-cannot-complete-command 
             `(lambda ()
                (interactive)
                (if (string= " " (this-command-keys))
                    (insert ?-)
                  (funcall ,ido-cannot-complete-command)))))
        ad-do-it))

; I don’t like to have smex update every time I run (auto-update is usually good enough, and is noticeably faster). But it’s annoying when I manually load a file and the new commands are not in smex. So I add a smex-update to after-load-functions.
(defun smex-update-after-load (unused)
  (when (boundp 'smex-cache)
    (smex-update)))
(add-hook 'after-load-functions 'smex-update-after-load)

; Using acronyms
; e.g. without this code the completion of ‘ffow’ shows:
; { ediff-show-registry | Buffer-menu-1-window | Buffer-menu-2-window ...
; with:
; { find-file-other-window | find-function-other-window | ediff-show-registry ...
;;; Filters ido-matches setting acronynm matches in front of the results
(defadvice ido-set-matches-1 (after ido-smex-acronym-matches activate)
  (if (and (fboundp 'smex-already-running) (smex-already-running)
           (> (length ido-text) 1))
      (let ((regex (concat "^" (mapconcat 'char-to-string ido-text "[^-]*-")))
            (acronym-matches (list))
            (remove-regexes '("-menu-")))
        ;; Creating the list of the results to be set as first
        (dolist (item items)
          (if (string-match ido-text item) ;; exact match
              (add-to-list 'acronym-matches item)
            (if (string-match (concat regex "[^-]*$") item) ;; strict match
                (add-to-list 'acronym-matches item)
              (if (string-match regex item) ;; appending relaxed match
                  (add-to-list 'acronym-matches item t)))))

        ;; Filtering ad-return-value
        (dolist (to_remove remove-regexes)
          (setq ad-return-value
                (delete-if (lambda (item)
                             (string-match to_remove item))
                           ad-return-value)))

        ;; Creating resulting list
        (setq ad-return-value
              (append acronym-matches
                      ad-return-value))

        (delete-dups ad-return-value)
        (reverse ad-return-value))))


;; find-file-in-project
;; https://github.com/technomancy/find-file-in-project

(setq ffip-project-root "~/code/project")

; M-x find-file-in-project
; M-x find-file-in-project-by-selected
; M-x find-file-with-similar-name
; M-x find-directory-in-project-by-selected
; M-x ffip-create-project-file
; M-x find-file-in-current-directory
; M-x find-file-in-current-directory-by-selected
; M-x ffip-show-diff-by-description or M-x ffip-show-diff
; M-x ffip-save-ivy-last and M-x ffip-ivy-resume
; M-x find-relative-path
; M-x ffip-diff-apply-hunk


;; ace-jump-mode

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; C-c SPC: find Char (as Initial of word)
;; C-u C-c SPC: find Char
;; C-u C-u C-c SPC: find Line



(provide 'init-my-plugin)
