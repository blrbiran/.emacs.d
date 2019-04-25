;; screenshot in org-mode
;; modified by gift.young@gmail.com
;; based on [http://praktikanten.brueckenschlaeger.org/2010/11/28/screenshots-in-org-mode]
;; you need install scrot in UNIX system

(defun my-screenshot () 
  "Take a screenshot into a unique-named file in the current buffer file
 directory and insert a link to this file." 
  (interactive) 
  (setq filename (concat (make-temp-name (concat (file-name-directory (buffer-file-name)) "images/") ) ".png")) 
  (if (file-accessible-directory-p (concat (file-name-directory (buffer-file-name)) "images/")) nil
    (make-directory "images")) 
  (call-process-shell-command "scrot" nil nil nil nil "-s" (concat "/"" filename "/"" )) 
  (insert (concat "[["  filename "]]")) 
  (org-display-inline-images))

(global-set-key (kbd "s-s") 'my-screenshot)

(provide 'init-my-screen-shot)
