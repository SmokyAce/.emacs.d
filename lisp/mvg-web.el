(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(setq web-mode-indent-style 2)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;(setq web-mode-attr-indent-offset 2)

(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)
(setq web-mode-block-padding 0)

(setq web-mode-comment-style 2)

(setq web-mode-enable-auto-pairing t)

(setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))))
(setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))))

(setq web-mode-engines-alist
	  '(("php" . "\\.phtml\\'")
		("blade" . "\\.blade\\'")
		("php" . "\\.html\\'")))

(setq web-mode-ac-source-alist
	  '(("css" . (ac-source-css-property))
		("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(add-hook 'web-mode-before-auto-complete-hooks
		  '(lambda ()
			 (let ((web-mode-cur-language
					(web-mode-language-at-pos)))
			   (if (string = web-mode-cur-language "php")
				   (yas-activate-extra-mode 'php-mode)
				 (yas-deactivate-extra-mode 'php-mode))
			   (if (string = web-mode-cur-language "css")
				   (setq emmet-use-css-transform t)
				 (setq emmet-use-css-transform nil)))))

(setq web-mode-enable-current-element-highlight t)


(provide 'mvg-web)
