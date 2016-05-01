(make-variable-buffer-local
 (defvar tts nil "text to speech process"))

(defun tts-up ()
  (interactive)
  (and (not (null tts))
       (eq (process-status tts) 'run)))

(defun tts-start ()
  (interactive)
  (if (not (tts-up))
      (setq tts
            (start-process "tts-python"
                           "*tts-python*"
                           "python" (file-truename "~/.emacs.d/module/speak-mode/speak.py")))))

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

