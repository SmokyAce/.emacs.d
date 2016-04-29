;;; mvg-paredit.el --- Enable mvg-paredit

;;; Commentary:

;;; Code:
(require-package 'paredit)
(autoload 'enable-paredit-mode "paredit")

(defun mvg-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

(add-hook 'prog-mode-hook 'mvg-paredit-nonlisp)
(add-hook 'css-mode-hook 'mvg-paredit-nonlisp)
(add-hook 'jade-mode-hook 'mvg-paredit-nonlisp)

(after-load 'paredit
  (define-key paredit-mode-map "{" 'paredit-open-curly)
  (define-key paredit-mode-map "}" 'paredit-close-curly-and-newline)
  (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)
  (define-key paredit-mode-map (kbd "M-}") 'paredit-close-curly-and-newline)
)

;; (defun maybe-map-paredit-newline ()
;;   (unless (or (memq major-mode '(inferior-emacs-lisp-mode cider-repl-mode))
;;               (minibufferp))
;;     (local-set-key (kbd "RET") 'paredit-newline)))

;; (add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)

;; (after-load 'paredit
;;   (add-hook 'paredit-mode-hook (lambda () (setq mode-name "Par")))
;;   ;;(diminish 'paredit-mode "Par")
;;   (dolist (binding (list (kbd "C-<left>") (kbd "C-<right>")
;;                          (kbd "C-M-<left>") (kbd "C-M-<right>")))
;;     (define-key paredit-mode-map binding nil))

;;   ;; Modify kill-sentence, which is easily confused with the kill-sexp
;;   ;; binding, but doesn't preserve sexp structure
;;   (define-key paredit-mode-map [remap kill-sentence] 'paredit-kill)
;;   (define-key paredit-mode-map [remap backward-kill-sentence] nil)

;;   ;; Allow my global binding of M-? to work when paredit is active
;;   (define-key paredit-mode-map (kbd "M-?") nil))


;; ;; Compatibility with other modes

;; ;; (suspend-mode-during-cua-rect-selection 'paredit-mode)


;; ;; Use paredit in the minibuffer
;; ;; TODO: break out into separate package
;; ;; http://emacsredux.com/blog/2013/04/18/evaluate-emacs-lisp-in-the-minibuffer/
;; (add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

;; (defvar paredit-minibuffer-commands '(eval-expression
;;                                       pp-eval-expression
;;                                       eval-expression-with-eldoc
;;                                       ibuffer-do-eval
;;                                       ibuffer-do-view-and-eval)
;;   "Interactive commands for which paredit should be enabled in the minibuffer.")

;; (defun conditionally-enable-paredit-mode ()
;;   "Enable paredit during lisp-related minibuffer commands."
;;   (if (memq this-command paredit-minibuffer-commands)
;;       (enable-paredit-mode)))

;; ----------------------------------------------------------------------------
;; Enable some handy paredit functions in all prog modes
;; ----------------------------------------------------------------------------

(provide 'mvg-paredit)
;;; mvg-paredit.el ends here
