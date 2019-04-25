;; Set load path
(eval-when-compile 
  (require 'cl))
(if (fboundp 'normal-top-level-add-to-load-path) 
    (let* ((my-module-dir "~/.emacs.d/module/") 
           (default-directory my-module-dir)) 
      (progn 
        (setq load-path (append (loop for dir in (directory-files my-module-dir) unless
                                      (string-match "^\\." dir) collecting (expand-file-name dir))
                                load-path)))))

(provide 'init-my-module)
