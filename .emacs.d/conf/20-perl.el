;;; init-cperl.el --- Cperl Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  CPerl mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;emacs25付属のcperlモードではなく自分でインストールした最新のcperl-modeを使う。
(require 'cperl-mode "~/.emacs.d/elisp/cperl-mode")
(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
;(defalias 'perl-mode 'cperl-mode)
;(add-to-list 'auto-mode-alist '("\\.[Pp][LlMm][Cc]?$" . cperl-mode))

;;; If you use font-lock feature of this mode, it is advisable to use
;; either lazy-lock-mode or fast-lock-mode.  I prefer lazy-lock.

(setq cperl-hairy t
      cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-close-paren-offset -4
      cperl-comment-column 40
      cperl-highlight-variables-indiscriminately t
      cperl-indent-parens-as-block t
      cperl-label-offset -4
      cperl-tab-always-indent nil  
;"*Non-nil means TAB in CPerl mode should always reindent the current line,
;regardless of where in the line point is when the TAB command is used."
      cperl-invalid-face nil
      cperl-auto-newline t
      cperl-electric-keywords t ;; expands for keywords such as foreach, while, etc...

)

(add-hook 'cperl-mode-hook
           (lambda ()
	     (cperl-set-style "PerlStyle");インデント4個
; 	    (outline-minor-mode t)
; 	    (setq outline-minor-mode-prefix "\C-c\C-o")
;;	    (hide-body)
;; 	    (local-set-key "\C-c\C-c\C-f" 'cperl-info-on-command)
;; 	    (local-set-key "\C-c\C-c\C-h" 'cperl-get-help)
;; 	    (local-set-key "\M-\t" 'perlplus-complete-symbol)
;; 	    (local-set-key "\C-h" 'backward-delete-char)
;; ;	    (define-key cperl-mode-map "\C-h" 'backward-delete-char)
;;             (require 'perlplus)
;;             (perlplus-setup)
	    )
)




(require 'perl-find-library)

;(add-hook 'cperl-mode-hook 
;	  '(lambda ()
;	     (cperl-set-style "PerlStyle")
;	     (local-set-key "\C-h" 'backward-delete-char)
;	     (local-set-key "\C-c\C-c\C-h" 'cperl-get-help)
;	     (local-set-key "\C-c\C-c\C-f" 'cperl-info-on-command)
;	     ))

;; http://d.hatena.ne.jp/antipop/20080701/1214838633より転記
;; flymake (Emacs22から標準添付されている)
(require 'flymake)

;; set-perl5lib
;; 開いたスクリプトのパスに応じて、@INCにlibを追加してくれる
;; 以下からダウンロードする必要あり
;; http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
(require 'set-perl5lib)

;; エラー、ウォーニング時のフェイス
(set-face-background 'flymake-errline "red4")
(set-face-foreground 'flymake-errline "black")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "black")

;; エラーをミニバッファに表示
;; http://d.hatena.ne.jp/xcezx/20080314/1205475020
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
	 (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
	 (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
	(let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
	       (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
	       (text (flymake-ler-text (nth (1- count) line-err-info-list)))
	       (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
	  (message "[%s] %s" line text)))
      (setq count (1- count)))))

;; Perl用設定
;; http://unknownplace.org/memo/2007/12/21#e001
(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(defconst flymake-allowed-perl-file-name-masks
  '(("\\.pl$" flymake-perl-init)
    ("\\.pm$" flymake-perl-init)
    ("\\.t$" flymake-perl-init)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (set-perl5lib)
  (flymake-mode t))

(add-hook 'cperl-mode-hook 'flymake-perl-load)



;; (define-key global-map [S-down-mouse-2] 'imenu)

;;-- perl-mode --
;; (autoload 'perl-mode "perl-mode" t)
;; (setq perl-indent-level 2)
;; (defun perl-insert-header ()
;;   (interactive)
;;   (goto-char 1)
;;   (insert "#!/usr/local/bin/perl -- # -*-Perl-*-\n"))
;; (add-hook 'cperl-mode-hook
;;           '(lambda () (define-key cperl-mode-map "\C-ci" 'perl-insert-header)))
;; (add-to-list 'auto-mode-alist '("\\.pl$" . perl-mode))

;; (autoload 'perl-mode "cperl-mode" "Edit perl script." t)
;; (setq perl-tab-to-comment t)
;; ;(autoload 'perl-mode "perl-mode" "alternate mode for editing Perl programs." t)
;; (setq auto-mode-alist (append (list (cons "\\.pl$" 'perl-mode)
;;                                     (cons "\\.prl$" 'perl-mode)
;;                                     (cons "\\.cgi$" 'perl-mode))
;;                               auto-mode-alist))



;; (when (locate-library "cperl-mode")
;;   (setq auto-mode-alist
;;         (cons '("\\.pl\\'" . cperl-mode) auto-mode-alist))

;;   (setq cperl-indent-alist
;;         '((string nil)
;;           (comment nil)
;;           (toplevel 0)
;;           (toplevel-after-parenth 4)
;;           (toplevel-continued 4)
;;           (expression 1)))

;;   ) ;; cperl-mode ends here.


;; (add-hook 'cperl-mode-hook '(lambda ()
;;         (make-face 'cperl-nonverridable-face)
;;         (set-face-foreground 'cperl-nonoverridable-face "DimGray")
;;         (setq cperl-nonoverridable-face 'cperl-nonoverridable-face)
;;         (make-face 'cperl-hash-face)
;;         (set-face-foreground 'cperl-hash-face "DodgerBlue4")
;;         (setq cperl-hash-face 'cperl-hash-face)
;;         (make-face 'cperl-array-face)
;;         (set-face-foreground 'cperl-array-face "DodgerBlue3")
;;         (setq cperl-array-face 'cperl-array-face)
;; ))


;; (if (< emacs-minor-version 3)
;;     (require 'perldoc))

;; 
;; (autoload 'cperl-mode "cperl-mode" "cperl-mode" t)

;; (setq auto-mode-alist 
;;       (cons '("\\.pl$" . cperl-mode) auto-mode-alist))

;; 
;; (add-hook 'cperl-mode--hook
;; 	  (global-set-key (kbd "RET") 'newline-and-indent))

;; =================================================
;; ;;;Perl-Mode
;; (autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
;; (setq cperl-indent-level 4) ;TAB4でインデント(スペース使用)
;; ;;; ファイルのコーディングシステム
;; ;;; CGIはeuc-jp
;; (add-hook 'find-file-hooks
;;           (function (lambda ()
;;                       (if (string-match   "\\.cgi$" buffer-file-name)
;;                           (setq buffer-file-coding-system 'euc-jp)
;;                         ))))
;; ;;; Perl Scriptはeuc-jp
;; (add-hook 'find-file-hooks
;;           (function (lambda ()
;;              (if (string-match   "\\.pl$" buffer-file-name)
;;                  (setq buffer-file-coding-system 'euc-jp)
;;                ))))

;(require 'perldoc)
