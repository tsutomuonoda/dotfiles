;;; init-scm.el --- SCM Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; schemeの設定 (以下はMIT schemeとgaucheで場合分けする)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; MIT schemeの場合(以下2行をコメントアウトする)
;;(require 'xscheme "~/lib/emacs/21.3/elisp/xscheme")
;;(setq scheme-program-name "scheme")
;; gaucheの場合(以下2行をコメントアウトする)
;(require 'cmuscheme);; quackを使わない場合
(require 'quack);;; quack


;;ここから
(defun my-quack-scheme-mode-hook ()
  (modify-coding-system-alist 'process "/usr/bin/gosh" '(utf-8 . utf-8))
  (setq scheme-program-name "/usr/bin/gosh -i")
;  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix) ;;課題：ファイルのエンコードをutf8にする
  (setq quack-pretty-lambda-p t)	      ;;ラムダ変換
  (setq quack-smart-open-paren-p t)	      ;;'['で'('が打ちこめる
  ;;;From Gauche:EditingWithEmacs
  ;;インデント設定
  (put 'and-let* 'scheme-indent-function 1)
  (put 'begin0 'scheme-indent-function 0)
  (put 'call-with-client-socket 'scheme-indent-function 1)
  (put 'call-with-input-conversion 'scheme-indent-function 1)
  (put 'call-with-input-file 'scheme-indent-function 1)
  (put 'call-with-input-process 'scheme-indent-function 1)
  (put 'call-with-input-string 'scheme-indent-function 1)
  (put 'call-with-iterator 'scheme-indent-function 1)
  (put 'call-with-output-conversion 'scheme-indent-function 1)
  (put 'call-with-output-file 'scheme-indent-function 1)
  (put 'call-with-output-string 'scheme-indent-function 0)
  (put 'call-with-temporary-file 'scheme-indent-function 1)
  (put 'call-with-values 'scheme-indent-function 1)
  (put 'dolist 'scheme-indent-function 1)
  (put 'dotimes 'scheme-indent-function 1)
  (put 'if-match 'scheme-indent-function 2)
  (put 'let*-values 'scheme-indent-function 1)
  (put 'let-args 'scheme-indent-function 2)
  (put 'let-keywords* 'scheme-indent-function 2)
  (put 'let-match 'scheme-indent-function 2)
  (put 'let-optionals* 'scheme-indent-function 2)
  (put 'let-syntax 'scheme-indent-function 1)
  (put 'let-values 'scheme-indent-function 1)
  (put 'let/cc 'scheme-indent-function 1)
  (put 'let1 'scheme-indent-function 2)
  (put 'letrec-syntax 'scheme-indent-function 1)
  (put 'make 'scheme-indent-function 1)
  (put 'match 'scheme-indent-function 1)
  (put 'match-lambda 'scheme-indent-function 1)
  (put 'match-let 'scheme-indent-fucntion 1)
  (put 'match-let* 'scheme-indent-fucntion 1)
  (put 'match-letrec 'scheme-indent-fucntion 1)
  (put 'match-let1 'scheme-indent-function 2)
  (put 'match-define 'scheme-indent-fucntion 1)
  (put 'multiple-value-bind 'scheme-indent-function 2)
  (put 'parameterize 'scheme-indent-function 1)
  (put 'parse-options 'scheme-indent-function 1)
  (put 'receive 'scheme-indent-function 2)
  (put 'rxmatch-case 'scheme-indent-function 1)
  (put 'rxmatch-cond 'scheme-indent-function 0)
  (put 'rxmatch-if  'scheme-indent-function 2)
  (put 'rxmatch-let 'scheme-indent-function 2)
  (put 'syntax-rules 'scheme-indent-function 1)
  (put 'unless 'scheme-indent-function 1)
  (put 'until 'scheme-indent-function 1)
  (put 'when 'scheme-indent-function 1)
  (put 'while 'scheme-indent-function 1)
  (put 'with-builder 'scheme-indent-function 1)
  (put 'with-error-handler 'scheme-indent-function 0)
  (put 'with-error-to-port 'scheme-indent-function 1)
  (put 'with-input-conversion 'scheme-indent-function 1)
  (put 'with-input-from-port 'scheme-indent-function 1)
  (put 'with-input-from-process 'scheme-indent-function 1)
  (put 'with-input-from-string 'scheme-indent-function 1)
  (put 'with-iterator 'scheme-indent-function 1)
  (put 'with-module 'scheme-indent-function 1)
  (put 'with-output-conversion 'scheme-indent-function 1)
  (put 'with-output-to-port 'scheme-indent-function 1)
  (put 'with-output-to-process 'scheme-indent-function 1)
  (put 'with-output-to-string 'scheme-indent-function 1)
  (put 'with-port-locking 'scheme-indent-function 1)
  (put 'with-string-io 'scheme-indent-function 1)
  (put 'with-time-counter 'scheme-indent-function 1)
  (put 'with-signal-handlers 'scheme-indent-function 1)
;;;括弧の強調:scheme-modeをロードするまではshow-paren-modeだけだが
;;;scheme-modeをロードするとscmファイルだけでなくほかのモードでも有効になってしまう。
;;;emacsの内部構造にかかわることと思われる。時間があったら調べる。
  (require 'mic-paren)
  (paren-activate)
  (setq paren-match-face 'bold)
  (setq paren-sexp-mode t)


)

(add-hook 'scheme-mode-hook 'my-quack-scheme-mode-hook) 
(add-hook 'inferior-scheme-mode-hook 'my-quack-scheme-mode-hook)

(defun scheme-other-window ()
  "Run schem on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
	   "\C-cS" 'scheme-other-window) 
;;ここまでは共通

;;ここからはMIT scheme用Info設定(MIT schemeを使う場合以下をコメントアウトする)
;;(defun mit-scheme-info ()
;;  (interactive)
;;  (info
;;   "/usr/local/lib/mit-scheme/edwin/info/mit-scheme-ref.info.gz"))
;ここまで

;;ここからはgauche用Info設定(gaucheを使う場合以下をコメントアウトする)
(defun gauche-info ()
  (interactive)
  (info
   "/usr/share/info/gauche-refj.info.gz"))
;;ここまで

 (cond
  ((string= scheme-program-name "scheme") (define-key global-map "\C-cI" 'mit-scheme-info))
  ((string= scheme-program-name "/usr/bin/gosh") (define-key global-map "\C-cI" 'gauche-info))
  )

;; (defun scheme-namep (x)
;;   (string= scheme-program-name (x)))

;; (cond
;;  ((scheme-namep "scheme") (define-key global-map "\C-cI" 'mit-scheme-info))
;;  ((scheme-namep "gosh") (define-key global-map "\C-cI" 'gauche-info))
;;  )
