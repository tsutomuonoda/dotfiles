;;; init-gde.el --- GDE Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;; GDE-mode
(autoload 'gde-mode "gde" 
  "Mode for editing gauche scheme source files" t)
(setq auto-mode-alist
      (append '(("\\.gscm$" . gde-mode)) auto-mode-alist))
