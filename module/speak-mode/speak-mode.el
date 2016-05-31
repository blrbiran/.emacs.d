(make-variable-buffer-local
 (defvar tts nil "text to speech process"))

(defun tts-up ()
  (interactive)
  (and (not (null tts))
       (eq (process-status tts) 'run)))


;;根据系统设定
(setq *is-a-mac* (eq system-type 'darwin) )
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
;;系统为windows以及cygwin时，设置为gbk，其他时候为utf-8

(defun tts-start ()
  (interactive)
  (let ((speak-coding
		 (cond (*win64* "gbk")
			   (*cygwin* "gbk")
			   (t "utf-8"))))
	(if (not (tts-up))
		(setq tts
			  (start-process "tts-python" "*tts-python*"
							 "python" (file-truename "~/.emacs.d/module/speak-mode/speak.py") speak-coding)))))

(defun tts-end ()
  (interactive)
  (delete-process tts)
  (setq tts nil))

(defun tts-say (text)
  (interactive)
  (tts-start)
  (process-send-string tts (concat text "\n")))

(defun tts-say-all ()
  (interactive)
  (tts-start)
  (process-send-string tts (concat (buffer-string) "\n")))

;;;###autoload
(define-minor-mode speak-mode
  "Speak selection words"
  :lighter " speaker"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c C-a a") 'tts-say-all)
			(define-key map (kbd "C-c C-a e") 'tts-end)
            map))

;;;###autoload
(add-hook 'text-mode-hook 'speak-mode)

(provide 'speak-mode)

