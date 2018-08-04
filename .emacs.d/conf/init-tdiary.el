;;; init-tdiary.el --- Tdiary Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;; tDiary-mode
(setq tdiary-diary-list '(("���Τ٤����̩����" "http://tdiary.onodalaw.com/")))
(setq tdiary-text-directory (expand-file-name "~/tdiary"))
(setq tdiary-browser-function 'w3m-browse-url);�ѹ���
(setq tdiary-coding-system 'euc-japan-unix);�ѹ���
(setq tdiary-style-mode 'emacs-wiki-mode);�ѹ���
(autoload 'tdiary-mode "tdiary-mode" nil t)
(autoload 'tdiary-new "tdiary-mode" nil t)
(autoload 'tdiary-new-diary "tdiary-mode" nil t)
(autoload 'tdiary-replace "tdiary-mode" nil t)
(add-to-list 'auto-mode-alist
	     '("\\.td$" . tdiary-mode))


