;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-gray30)

;; 设置主题  http://download.savannah.gnu.org/releases/color-theme/ 下载 color-theme-6.6.0.zip 并解压
;; 之后将 color-theme-6.6.0 中的 color-theme.el 和 themes 文件夹复制到 ~/.emacs.d
;; 打开 emacs , M-x color-theme-select, 回车查看效果，d 查看主题信息(主题名)
;;(add-to-list 'load-path "~/.emacs.d")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-subtle-hacker)
;;(color-theme-dark-blue2)
;;(color-theme-calm-forest)
;;(color-theme-comidia)
;;(color-theme-fischmeister)
;;(color-theme-jonadabian-slate)
;;(color-theme-snow)
;;(color-theme-standard-xemacs)
;;(color-theme-gray30)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'zenburn t)
;;(load-theme 'tangotango t)
(load-theme 'spacemacs-dark t)

(provide 'init-color-theme)
