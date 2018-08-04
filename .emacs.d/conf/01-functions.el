;;; init-functions.el --- functions Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;ビープ音を消す
(setq ring-bell-function (lambda ()))

;;; テキストモードにて一行が 30 字以上になった時には自動改行する

;(add-hook 'text-mode-hook
;	  (lambda ()
;	    (auto-fill-mode 1)
;	    (setq fill-column 60)))

;(setq default-major-mode 'text-mode)

;;;コピー&ペーストの履歴
;; browse-kill-ring
(autoload 'browse-kill-ring "browse-kill-ring"
  "\Display items in the 'kill-ring' in another buffer. " t)
(global-set-key (kbd "C-c y") 'browse-kill-ring)

;;minibuf-isearch
;(require 'minibuf-isearch)

;Warning (bytecomp): ‘isearch-word’ is an obsolete variable (as of 25.1)
; use ‘isearch-regexp-function’ instead. [2 times]



;;「最近使ったファイル」をメニューに表示する
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 20)
(setq recentf-exclude '("^/[^/:]+:"));;Trampやange-ftpのリモートファイルが記録されないようにする

;;ファイル更新日を自動的に書き換える
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last updated : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")

;;スクリプトを保存する時，自動的に chmod +x を行う
(add-hook 'after-save-hook
         'executable-make-buffer-file-executable-if-script-p)

;;Emacs の動作を軽快にしたい
(setq gc-cons-threshold 5242880)



;; ediffの設定
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;;; Lisp mode debug
;;(setq debug-on-error t)

;;;; multibyte characters in the menubar
(setq menu-coding-system 'euc-jp)

;; emacsclientからemacs上にファイルを開く。
(server-start)

;; バッファの高度な名前付け
(require 'uniquify)
(setq uniquify-buffer-name-styple 'post-forward-angle-brackets)

;; dired-x(dired拡張パッケージ)
(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))
(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
	    ;; (setq dired-omit-files-p t)
	    ))

;; tar+gzipの圧縮ファイル内へのアクセス
;; 読むときは問題ないが、書き出し時にファイルを壊してしまう場合があるとのことなので無効にしてある。
;(autoload 'tar-mode "tar-mode")
;(require 'jka-compr)
;(toggle-auto-compression 1)
