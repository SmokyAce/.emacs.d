(require-package 'jade-mode)
(require-package 'sws-mode)

(require 'sws-mode)
(require 'jade-mode)

(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))

(provide 'mvg-jade)
