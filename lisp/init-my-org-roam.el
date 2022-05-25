;; Special settings for Org-Roam

(setq org-roam-directory (file-truename "~/org"))
(setq org-roam-graph-executable (file-truename "/opt/homebrew/bin/dot"))

;; Org-roam to run functions on file changes to maintain cache consistency.
;; To build the cache manually, run M-x org-roam-db-sync.
(org-roam-db-autosync-mode)

;; For MacOS, brew install graphviz to use dot

(provide 'init-my-org-roam)
