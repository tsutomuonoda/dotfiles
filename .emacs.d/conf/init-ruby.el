;;; init-ruby.el --- ruby Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;; Ruby-mode
;; (setq ruby-program-name "/usr/local/bin/ruby")
;; (autoload 'ruby-mode "ruby-mode" 
;;   "Mode for editing ruby source files" t)
;; (setq auto-mode-alist
;;       (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
;; (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
;;     				     interpreter-mode-alist))

;; (autoload 'run-ruby "inf-ruby"
;;   "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;   "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (inf-ruby-keys)
;; 	     ))

(setq ruby-program-name "/usr/bin/ruby")
;(setq ruby-program-name "/usr/local/bin/ruby")
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; emacs22では固まるので使えない
;;;irbsh mode
;(setq ruby-program-name "/usr/bin/ruby -S irb")
;(setq ruby-program-name "/usr/bin/ruby1.9 -S /usr/bin/irb1.9 --inf-ruby-mode")
;(setq ruby-program-name "/usr/bin/ruby1.8 -S /usr/bin/irb1.8 --inf-ruby-mode")
;(setq ruby-program-name "/usr/bin/ruby1.9 -S /usr/bin/irb1.9")
;(setq ruby-program-name "/usr/bin/ruby1.8 -S /usr/bin/irb1.8")
;(setq ruby-program-name "/usr/bin/ruby1.9 -C /usr/lib/ruby/1.8/irbsh -S irb --inf-ruby-mode -r irbsh-lib.rb")
;(load "irbsh")
;(load "irbsh-toggle")
