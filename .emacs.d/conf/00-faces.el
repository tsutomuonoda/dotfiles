;;; init-faces.el --- face Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Xでのカラー表示
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'font-lock)
(if (not (featurep 'xemacs))
    (global-font-lock-mode t)
)

;GNOME desktopを使っている場合のフォント設定
;GNOMEのフォント設定で等幅フォントを変更すれば好みのフォントになる。
;(setq font-use-system-font t)

;Rictyのフォント設定
(set-face-attribute 'default nil
		    :family "Ricty Diminished Discord"
		    :height 200)
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0208
		  (cons "Ricty Diminished Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0212
		  (cons "Ricty Diminished Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'katakana-jisx0201
		  (cons "Ricty Diminished Discord" "iso10646-1"))

;;以下は古い設定が残っているので整理する。
;; TrueTypeフォントを使う設定。emacs22
;(setq default-frame-alist
;      (append '((font . "fontset-17")) default-frame-alist))

;; (if (and (eq window-system 'x) (>= emacs-major-version 23))
;; (progn
;; (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-14"))
;; (set-frame-font "Bitstream Vera Sans Mono-14")
;; (set-fontset-font "fontset-default"
;; 'japanese-jisx0208
;; '("ヒラギノ角ゴ Pro W3-14" . "unicode-bmp"))))

;(when window-system ;comment in
;  (progn ;;comment in
    ;; デフォルトフォントの設定
     ;; フォント名-フォントサイズで指定する。
;     (set-frame-font "ヒラギノ角ゴ Pro W6-14")
;    (set-frame-font "VL ゴシック-14")
;        (set-frame-font "Ricty Diminished Discord-16")
;    (set-frame-font "VL ゴシック-16") ;comment in
	;;     ;; 日本語(japanese-jisx0208)フォントの設定
;	(set-fontset-font ;comment in
;       (frame-parameter nil 'font) ;comment in
;       'japanese-jisx0208 ;comment in
;       '("Ricty Diminished Discord Regular-16" . "unicode-bmp"))
;       '("VL ゴシック-16" . "unicode-bmp")) ;comment in


;	(set-fontset-font
;       (frame-parameter nil 'font)
;       'japanese-jisx0208
;       '("ヒラギノ角ゴ Pro W3-14" . "unicode-bmp"))

    ;; (set-fontset-font
    ;;   (frame-parameter nil 'font)
    ;;    'katakana-jisx0201
    ;;    '("ヒラギノ角ゴ Pro W3-14" . "unicode-bmp"))

    ;; (set-fontset-font
    ;;   (frame-parameter nil 'font)
    ;;    'ascii
    ;;    '("DejaVu Sans Mono-14" . "unicode-bmp"))

    ;; (set-fontset-font
    ;;   (frame-parameter nil 'font)
    ;;    'unicode
    ;;    '("ヒラギノ角ゴ Pro W3-14" . "unicode-bmp"))

;     ) ;comment in
;  ) ;comment in

;;フォントの色付けモード
;(setq font-lock-support-mode 'jit-lock-mode)

;; no menubar, scrollbar, toolbar or blinky-blinky
(tool-bar-mode nil)
;(menu-bar-mode nil)
(scroll-bar-mode nil)

;;リージョンをハイライト
(transient-mark-mode t)

;;; 行数の表示
(setq line-number-mode t)

;; 桁数の表示
(setq column-number-mode t)

;; Show Paren Mode
(show-paren-mode 1)

;;;括弧の色を薄くする

;; 小括弧 () の色を定義
(defvar paren-face 'paren-face)
(make-face 'paren-face)
(set-face-foreground 'paren-face "#88aaff")
  
;; 中括弧 {} の色を定義
(defvar brace-face 'brace-face)
(make-face 'brace-face)
(set-face-foreground 'brace-face "#ffaa88")

;; 大括弧 [] の色を定義
(defvar bracket-face 'bracket-face)
(make-face 'bracket-face)
(set-face-foreground 'bracket-face "#aaaa00")
  
;; lisp-mode の色設定に追加
(setq lisp-font-lock-keywords-2
      (append '(("(\\|)" . paren-face))
	      lisp-font-lock-keywords-2))
  
;; scheme-mode の色設定に追加
;; (add-hook 'scheme-mode-hook
;; 	  '(lambda ()
;; 	     (setq scheme-font-lock-keywords-2
;; 		   (append '(("(\\|)" . paren-face))
;; 			   scheme-font-lock-keywords-2))))
  
;; c-mode の色設定に追加
;(setq c-font-lock-keywords-3
;      (append '(("(\\|)" . paren-face))
;	      '(("{\\|}" . brace-face))
;	      '(("\\[\\|\\]" . bracket-face))
;	      c-font-lock-keywords-3))

;; 現在行に色をつける
;(global-hl-line-mode 1)
;;色
;(set-face-background 'hl-line "darkolivegreen") 
