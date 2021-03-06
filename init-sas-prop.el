;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(setq user-full-name "Andranik Samvelovich Simonyan"
	  user-mail-address "andranik.s.s@gmail.com")

(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time
;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;; Bootstrap config
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'mvg-elpa)    ;; Machinery for installing required packages
;(require 'init-exec-path) ;; Set up $PATH

;(require-package 'wgrep)

(require 'init-themes)
(require 'init-gui-frames)
(require 'init-ido)

(require 'init-sessions)
(require 'init-fonts)

(require 'init-textile)
(require 'init-markdown)

(require 'init-git)
(require 'init-github)

(require 'init-misc)

(require 'mvg-auto-complete)
(require 'mvg-javascript)
(require 'mvg-web)
(require 'mvg-jade)
(require 'mvg-json)

(require 'mvg-apache)
(require 'mvg-nginx)

(require 'mvg-paredit)

(require 'sas-init-linum)
(require 'sas-init-bs)
(require 'sas-init-sr-speedbar)
(require 'sas-init-yasnippet)
(require 'sas-init-ergoemacs)
(require 'sas-init-mmm)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init-sas-prop)
