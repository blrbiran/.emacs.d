;; 将~/org/todo.org替换为todo.org实际路径
;;(setq org-agenda-files (list "~/org/todo.org"))
(setq org-agenda-files (list "~/org/inbox.org"
                             "~/org/task.org"
                             "~/org/note.org"
                             "~/org/project.org"
                             "~/org/done.org"))

;; 设置C-c C-w可以切换的文件和深度
(setq org-refile-targets (quote ((nil :maxlevel . 1)
                                 (org-agenda-files :maxlevel . 1))))

; Use full outline paths for refile targets - we file directly with IDO
;(setq org-refile-use-outline-path t)
; Targets complete directly with IDO
;(setq org-outline-path-complete-in-steps nil)
; Allow refile to create parent tasks with confirmation
;(setq org-refile-allow-creating-parent-nodes (quote confirm))

;;;; Refile settings
; Exclude DONE state tasks from refile targets
;(defun bh/verify-refile-target ()
;  "Exclude todo keywords with a done state from refile targets"
;  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

;(setq org-refile-target-verify-function 'bh/verify-refile-target)

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/note.org"))

(define-key global-map "\C-cc" 'org-capture)

;; (setq org-capture-templates
;; 	  '(("New" ?n "* %? %t \n %i\n %a" "~/org/inbox.org" )
;; 		("Task" ?t "** TODO %?\n %i\n %a" "~/org/task.org" "Tasks")
;; 		("Calendar" ?c "** TODO %?\n %i\n %a" "~/org/task.org" "Tasks")
;; 		("Idea" ?i "** %?\n %i\n %a" "~/org/task.org" "Ideas")
;; 		("Note" ?r "* %?\n %i\n %a" "~/org/note.org" )
;;		("Project" ?p "** %?\n %i\n %a" "~/org/project.org" %g) ))

(setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/org/task.org" "Task")
		"* TODO %?\n  SCHEDULED: %t\n  %i\n  %a")
	("n" "New" entry (file+headline "~/org/inbox.org" "Inbox")
		"* TODO %?\n  SCHEDULED: %t\n  %i\n  %a")
	("r" "Note" entry (file+headline "~/org/note.org" "Note")
		"* %?\n  %i\n  %a")
	("p" "Project" entry (file+datetree "~/org/project.org")
		"* %?\n  SCHEDULED: %t\n  %i\n  %a")))

;; 绑定 C-c a 键打开日程表
(global-set-key "\C-ca" 'org-agenda)

(provide 'init-my-org-agenda)
