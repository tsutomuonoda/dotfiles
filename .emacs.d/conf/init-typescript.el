;;; init-typescript.el --- TypeScript Setting File

;; Copyright (C) 2012  Tsutomu Onoda

;; Author: Tsutomu Onoda <tsutomu.onoda@gmail.com>
;; Keywords: 

;(require 'typescript-mode "~/lib/emacs/24/elisp/TypeScript")
;(autoload 'typescript-mode "~/lib/emacs/24/elisp/typescript" nil t)
(autoload 'typescript-mode "typescript" nil t)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

