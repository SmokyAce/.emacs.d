(add-hook 'json-mode-hook
		  (lambda ()
			(setq tab-width 4)
			(setq indent-tabs-mode t)))

(provide 'mvg-json)
