
;(package-initialize)
;(require 'ergoemacs-mode)

(require-package 'ergoemacs-mode)

(setq ergoemacs-theme nil) ; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(require 'ergoemacs-mode)
(ergoemacs-mode 1)

(setq ergoemacs-theme-options (quote ((save-options-on-exit off))))

(provide 'sas-init-ergoemacs)
