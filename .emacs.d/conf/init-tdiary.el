;;; init-tdiary.el --- Tdiary Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;; tDiary-mode
(setq tdiary-diary-list '(("おのべんの秘密日記" "http://tdiary.onodalaw.com/")))
(setq tdiary-text-directory (expand-file-name "~/tdiary"))
(setq tdiary-browser-function 'w3m-browse-url);変更点
(setq tdiary-coding-system 'euc-japan-unix);変更点
(setq tdiary-style-mode 'emacs-wiki-mode);変更点
(autoload 'tdiary-mode "tdiary-mode" nil t)
(autoload 'tdiary-new "tdiary-mode" nil t)
(autoload 'tdiary-new-diary "tdiary-mode" nil t)
(autoload 'tdiary-replace "tdiary-mode" nil t)
(add-to-list 'auto-mode-alist
	     '("\\.td$" . tdiary-mode))


