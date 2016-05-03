;; �趨���Ի���Ϊutf-8
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;(set-clipboard-coding-system 'utf-8)
;(set-selection-coding-system 'utf-8)

;;����ϵͳ�趨
(setq *is-a-mac* (eq system-type 'darwin) )
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
;;ϵͳΪwindows�Լ�cygwinʱ������Ϊgbk������ʱ��Ϊutf-8
(cond
 (*win64* (progn (prefer-coding-system 'gbk) (setq locale-coding-system 'gbk)))
 (*cygwin* (progn (prefer-coding-system 'gbk) (setq locale-coding-system 'gbk)))
 (t (progn (prefer-coding-system 'utf-8) (setq locale-coding-system 'utf-8))))


(provide 'init-my-language)
