;; 将~/org/todo.org替换为todo.org实际路径
(setq org-agenda-files (list "~/agenda/todo.org"))

;; 绑定 C-c a 键打开日程表
(global-set-key "\C-ca" 'org-agenda)

(provide 'init-my-org-agenda)
