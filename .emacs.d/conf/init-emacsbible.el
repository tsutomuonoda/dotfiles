;;; init-emacsbible.el --- Emacsテクニックバイブル

;; Copyright (C) 2011  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: elisp

;; auto-install.el
;;Emacs Lispインストーラを利用する
(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; auto-async-byte-compile.el
;; 自動バイトコンパイルする
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ELPA ELPAはもう古いそうでMarmaladeの設定をinit.elに書いた。
;; パッケージを簡単にインストールする
;; M-x package-list-packages
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;(when
;    (load
;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;  (package-initialize))

;; sticky.el
;; 大文字入力を楽にする
(require 'sticky)
;; ;を入力したい場合は;を二度押しする
(use-sticky-key ";" sticky-alist:en)    ; for english keyboards

;; ffap.el
;; 現在位置のファイルを開く
(ffap-bindings)

;; uniquify.el
;;  ファイル名がかぶった場合にバッファ名をわかりやすくする
(require 'uniquify)
;; filename<dir>形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")
 
;; iswitchb.el
;; ヴァファ切り換えを強化する
(iswitchb-mode 1)
;; バッファ読み取り関数をiswitchbにする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合にはtに設定する
(setq iswitchb-regexp nil)
;; 新しいバファを作成するときにいちいち聞いてこない
(setq iswitchb-prompt-newbuffer nil)

;; recentf.el
;; 最近使ったファイルを開く
(setq recentf-max-saved-items 3000)
;; 最近使ったファイルに加えないファイルを正規表現で指定する
(setq recentf-exclude '("/TAGS$" "/var/tmp/")
(require 'recentf-ext)

;; tempbuf.el
;; 使わないバファを自動的に消す
(require 'tempbuf)
;;ファイルを開いたら自動的にtempbufを有効にする
(add-hook 'find-file-hook 'turn-on-tempbuf-mode)
;;diredバファに対してtempbufを有効にする
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;;auto-save-buffers.el
;; ファイルを自動保存する
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers)；アイドル2秒で保存
