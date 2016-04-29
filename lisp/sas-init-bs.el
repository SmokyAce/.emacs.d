(require 'bs)
(global-set-key (kbd "<f2>") 'bs-show)

(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)

(provide 'sas-init-bs)
