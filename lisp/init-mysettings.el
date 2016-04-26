;; -*-Emacs-Lisp-*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;在标题栏提示你目前在什么位置
(setq frame-title-format "emacs@%b")


;;use melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;;设置有用的个人信息,这在很多地方有用。
(setq user-full-name "Biran")
(setq user-mail-address "blrbiran@163.com")

;;关闭开机画面
(setq inhibit-startup-message t)

;;显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)



;;tab键为4个字符宽度
(setq default-tab-width 4)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
;(mouse-avoidance-mode 'animate)

;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西
(setq kill-ring-max 200)


;; ????????????????????????????????

;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
;(ido-mode t)
;;ido模式中不保存目录列表,解决退出Emacs时ido要询问编码的问题。
;(setq ido-save-directory-list-file nil)

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
;(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;(setq sentence-end-double-space nil)

;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的foobar<?> 形式。
;(setq uniquify-buffer-name-style 'forward);;好像没起作用

;;让 Emacs 可以直接打开和显示图片。
;(setq auto-image-file-mode t)

;; End ????????????????????????????????

;;自动保存模式
;(setq auto-save-mode nil)

;; 设定不产生备份文件
(setq make-backup-files nil)

;; 不生成临时文件
(setq-default make-backup-files nil)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)


;; 设置光标为竖线
(setq-default cursor-type 'bar)
;; 设置光标为方块
;;(setq-default cursor-type 'box)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; check http://kidneyball.iteye.com/blog/1014537
;;1 更顺手的M-x（可以用C-x C-m或C-c C-m来触发）
(global-set-key "\C-x\C-m" 'execute-extended-command)
;(global-set-key "\C-c\C-n" 'execute-extended-command)

;;2 系统剪贴板快捷键（C-c C-c复制，C-c C-v粘贴，C-c x剪切）
(global-set-key "\C-c\C-c" 'clipboard-kill-ring-save)
(global-set-key "\C-cx" 'clipboard-kill-region)
(global-set-key "\C-c\C-v" 'clipboard-yank)

;;3 允许使用C-z作为命令前缀
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

;;4.1 用C-z i快速打开~/.emacs文件。  
(defun open-mysetting-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-mysettings.el"))

(global-set-key "\C-zi" 'open-mysetting-file)

;;4.2 用C-z C-i快速打开~/.emacs文件。  
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key "\C-z\C-i" 'open-init-file)

;;5 C-Space被输入法占用，改用C-c m来标记文本块
(global-set-key "\C-cm" 'set-mark-command)

;;6 关闭toolbar
(tool-bar-mode 0)

;;7 启用ibuffer支持，增强*buffer*
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;8 默认进入text-mode，而不是没有什么功能的fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;9 显示行号
(global-linum-mode t)

;;10 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;;11 设置初始目录为rails项目目录
(setq default-directory "/emacs")

;;12 设定语言环境为utf-8
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;13 打开一个新的shell
(defun newshell (name)
  (interactive "sBuffer's name: ")
  (eshell name)
)

;;14 用C-z k快速打开自定义的按键说明文件
(defun open-key-info-file()
  (interactive)
  (split-window-horizontally)
  (find-file-other-window "~/.emacs.d/emacskeys.txt")
  (org-mode)
;  (outline-mode)
  (hide-body))

(global-set-key "\C-zk" 'open-key-info-file)

;;15 启动0.5秒后自动最大化 （windows下）
(run-with-idle-timer 0.5 nil 'w32-send-sys-command 61488)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;------------语言环境字符集设置(utf-8)-------------
(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
     nil t))
(defvar font-list '("Microsoft Yahei" "宋体" "新宋体" "文泉驿等宽微米黑" "黑体" ))
(require 'cl) ;; find-if is in common list package
(find-if #'qiang-font-existsp font-list)
(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))
(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))
  
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
  
    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))
(qiang-set-font
 '("Consolas" "Arial" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=15"
 '("Microsoft Yahei" "宋体" "新宋体" "文泉驿等宽微米黑" "黑体" ))
;;Setting English Font
;;(set-face-attribute  'default nil :font "Consolas 12")
  
;; Chinese Font
;;(dolist (charset '(kana han symbol cjk-misc bopomofo)) (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Microsoft Yahei" :size 12)))
;;处理shell-mode乱码,好像没作用
 
;;------语言环境字符集设置结束------------

;;git-emacs
;;git clone https://github.com/tsgates/git-emacs.git
(add-to-list 'load-path "~/.emacs.d/git-emacs/")
(require 'git-emacs)



;;显示时间，格式如下
;;
;(require 'calendar)
;(setq calendar-date-display-form '(month "/" day "/" (substring year -2)))
;(require 'calendar)
;(setq display-time-string-forms '((calendar-julian-date-string)))
;(display-time)

(display-time-mode 1)
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
;(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 30);;时间的变化频率，单位 s


(provide 'init-mysettings)

