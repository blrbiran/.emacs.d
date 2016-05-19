;; 将~/org/todo.org替换为todo.org实际路径
;;(setq org-agenda-files (list "~/agenda/todo.org"))
(setq org-agenda-files (list "~/agenda/todo.org"
                             "~/agenda/done.org"
							 "~/agenda/project.org"))

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

;; 绑定 C-c a 键打开日程表
(global-set-key "\C-ca" 'org-agenda)

(provide 'init-my-org-agenda)
