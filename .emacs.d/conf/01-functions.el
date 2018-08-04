;;; init-functions.el --- functions Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;�ӡ��ײ���ä�
(setq ring-bell-function (lambda ()))

;;; �ƥ����ȥ⡼�ɤˤư�Ԥ� 30 ���ʾ�ˤʤä����ˤϼ�ư���Ԥ���

;(add-hook 'text-mode-hook
;	  (lambda ()
;	    (auto-fill-mode 1)
;	    (setq fill-column 60)))

;(setq default-major-mode 'text-mode)

;;;���ԡ�&�ڡ����Ȥ�����
;; browse-kill-ring
(autoload 'browse-kill-ring "browse-kill-ring"
  "\Display items in the 'kill-ring' in another buffer. " t)
(global-set-key (kbd "C-c y") 'browse-kill-ring)

;;minibuf-isearch
;(require 'minibuf-isearch)

;Warning (bytecomp): ��isearch-word�� is an obsolete variable (as of 25.1)
; use ��isearch-regexp-function�� instead. [2 times]



;;�ֺǶ�Ȥä��ե�����פ��˥塼��ɽ������
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 20)
(setq recentf-exclude '("^/[^/:]+:"));;Tramp��ange-ftp�Υ�⡼�ȥե����뤬��Ͽ����ʤ��褦�ˤ���

;;�ե����빹������ưŪ�˽񤭴�����
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last updated : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")

;;������ץȤ���¸���������ưŪ�� chmod +x ��Ԥ�
(add-hook 'after-save-hook
         'executable-make-buffer-file-executable-if-script-p)

;;Emacs ��ư���ڲ��ˤ�����
(setq gc-cons-threshold 5242880)



;; ediff������
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;;; Lisp mode debug
;;(setq debug-on-error t)

;;;; multibyte characters in the menubar
(setq menu-coding-system 'euc-jp)

;; emacsclient����emacs��˥ե�����򳫤���
(server-start)

;; �Хåե��ι��٤�̾���դ�
(require 'uniquify)
(setq uniquify-buffer-name-styple 'post-forward-angle-brackets)

;; dired-x(dired��ĥ�ѥå�����)
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

;; tar+gzip�ΰ��̥ե�������ؤΥ�������
;; �ɤ�Ȥ�������ʤ������񤭽Ф����˥ե����������Ƥ��ޤ���礬����ȤΤ��ȤʤΤ�̵���ˤ��Ƥ��롣
;(autoload 'tar-mode "tar-mode")
;(require 'jka-compr)
;(toggle-auto-compression 1)
