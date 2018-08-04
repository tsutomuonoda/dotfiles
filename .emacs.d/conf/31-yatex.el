;;; init-yatex.el --- YaTeX Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: yatex

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; YaTeX mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)


(setq YaTeX-default-documentclass "jsarticle"
      tex-command "platex -kanji=utf8"
      dvi2-command "xdvi -geo +0+0 -s 4"
;      dvi2-command "pxdvi -geo +0+0 -s 4"
      makeindex-command "mendex -E"
      dviprint-command-format "dvipdfmx -v -p a4 %s"
      YaTeX-template-file "/home/onoben/skel/template.tex"
      YaTeX-kanji-code 4 ; utf-8
;      YaTeX-inhibit-prefix-key t
;      YaTeX-prefix "\C-c"
;      YaTeX-use-font-lock nil
      )



;; YaTeX hook
(add-hook 'yatex-mode-hook
	  (lambda ()
	    (require 'skk)
	    (setq skk-kutouten-type 'en);;YaTeX のときだけ句読点を変更する。
	    (auto-fill-mode -1);;オートフィルをoffにする。



;	    (require 'color-theme)
;	    (font-lock-type-face ((t nil)))
;	    (font-lock-doc-face ((t nil)))

;	    'turn-off-font-lock
;	    (require 'color-theme)
;	    '(font-lock-doc-face ((t nil)))
;	    '(font-lock-string-face ((t nil)))

	    ))
