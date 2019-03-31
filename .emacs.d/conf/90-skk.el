;;; init-skk.el --- SKK Conf

;; Copyright (C) 2009-2016  Tutomu Onoda

;; Author: Tutomu Onoda <tsutomu.onoda@gmail.com>
;; Keywords: lisp, 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 漢字変換 (skk) の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 手動で入れたEmacs26とパッケージEmacs25の切り替え
(when (< emacs-major-version 26)
;; Please see '/usr/share/doc/ddskk/README.Debian'
  (set-input-method "japanese-skk")
  (inactivate-input-method))

;; Please see '/usr/share/doc/ddskk/examples/dot.emacs'

;;; 注意:

;; SKK の設定は、~/.skk の方が優先されます。
;; 下記の設定は、特殊な事情があるため ~/.skk ではうまく機能しない設定を
;; 集めていますので、下記以外は ~/.skk で設定することをお勧めします。

;;; Code:

;; @@ 基本の設定

;; ~/.skk にいっぱい設定を書いているのでバイトコンパイルしたい
(setq skk-byte-compile-init-file nil)
;; 注) 異なる種類の Emacsen を使っている場合は nil にします

;; SKK を Emacs の input method として使用する
;;   `toggle-input-method' (C-\) で DDSKK が起動します
;(setq default-input-method
;;      "japanese-skk"			; (skk-mode 1)
;;    "japanese-skk-auto-fill"		; (skk-auto-fill-mode 1)
;      )

;; SKK を起動していなくても、いつでも skk-isearch を使う
(setq skk-isearch-mode-enable 'always)

;; @@ 応用的な設定

;; migemo を使うから skk-isearch にはおとなしくしていて欲しい
;(setq skk-isearch-start-mode 'latin)


;; Org mode のときだけ句読点を変更したい
;(add-hook 'org-mode-hook
;	  (lambda ()
;	    (require 'skk)
;	    (setq skk-kutouten-type 'en)))


;; YaTeX のときだけ句読点を変更したい
;(add-hook 'yatex-mode-hook
;	  (lambda ()
;	    (require 'skk)
;	    (setq skk-kutouten-type 'en)))



;; 文章系のバッファを開いた時には自動的に英数モード(「SKK」モード)に入る
;; beacon-modeをonにする。
(let ((function #'(lambda ()
		    (require 'skk)
		    (skk-latin-mode-on)
		    (beacon-mode 1)
		    )))
  (dolist (hook '(find-file-hooks
		  ;; ...
		  mail-setup-hook
		  message-setup-hook))
    (add-hook hook function)))

;; Emacs 起動時に SKK を前もってロードする
(setq skk-preload t)
;; 注) skk.el をロードするだけなら (require 'skk) でもよい。上記設定の
;; 場合は、skk-search-prog-list に指定された辞書もこの時点で読み込んで
;; 準備する。Emacs の起動は遅くなるが，SKK を使い始めるときのレスポンス
;; が軽快になる。


;; dired-x を load すると、通常 skk の起動キーに使われている C-x C-j が
;; dired-jump に奪われてしまう。 これを避けるための設定。
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            (global-set-key "\C-x\C-j" 'skk-mode)
            ))

;;; dot.emacs ends here
