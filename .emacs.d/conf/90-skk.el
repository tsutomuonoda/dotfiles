;;; init-skk.el --- SKK Conf

;; Copyright (C) 2009-2016  Tutomu Onoda

;; Author: Tutomu Onoda <tsutomu.onoda@gmail.com>
;; Keywords: lisp, 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �����Ѵ� (skk) ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ��ư�����줿Emacs26�ȥѥå�����Emacs25���ڤ��ؤ�
(when (< emacs-major-version 26)
;; Please see '/usr/share/doc/ddskk/README.Debian'
  (set-input-method "japanese-skk")
  (inactivate-input-method))

;; Please see '/usr/share/doc/ddskk/examples/dot.emacs'

;;; ���:

;; SKK ������ϡ�~/.skk ������ͥ�褵��ޤ���
;; ����������ϡ��ü�ʻ��𤬤��뤿�� ~/.skk �ǤϤ��ޤ���ǽ���ʤ������
;; ����Ƥ��ޤ��Τǡ������ʳ��� ~/.skk �����ꤹ�뤳�Ȥ򤪴��ᤷ�ޤ���

;;; Code:

;; @@ ���ܤ�����

;; ~/.skk �ˤ��äѤ������񤤤Ƥ���ΤǥХ��ȥ���ѥ��뤷����
(setq skk-byte-compile-init-file nil)
;; ��) �ۤʤ����� Emacsen ��ȤäƤ������ nil �ˤ��ޤ�

;; SKK �� Emacs �� input method �Ȥ��ƻ��Ѥ���
;;   `toggle-input-method' (C-\) �� DDSKK ����ư���ޤ�
;(setq default-input-method
;;      "japanese-skk"			; (skk-mode 1)
;;    "japanese-skk-auto-fill"		; (skk-auto-fill-mode 1)
;      )

;; SKK ��ư���Ƥ��ʤ��Ƥ⡢���ĤǤ� skk-isearch ��Ȥ�
(setq skk-isearch-mode-enable 'always)

;; @@ ����Ū������

;; migemo ��Ȥ����� skk-isearch �ˤϤ��Ȥʤ������Ƥ����ߤ���
;(setq skk-isearch-start-mode 'latin)


;; Org mode �ΤȤ��������������ѹ�������
;(add-hook 'org-mode-hook
;	  (lambda ()
;	    (require 'skk)
;	    (setq skk-kutouten-type 'en)))


;; YaTeX �ΤȤ��������������ѹ�������
;(add-hook 'yatex-mode-hook
;	  (lambda ()
;	    (require 'skk)
;	    (setq skk-kutouten-type 'en)))



;; ʸ�ϷϤΥХåե��򳫤������ˤϼ�ưŪ�˱ѿ��⡼��(��SKK�ץ⡼��)������
;; beacon-mode��on�ˤ��롣
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

;; Emacs ��ư���� SKK ������äƥ��ɤ���
(setq skk-preload t)
;; ��) skk.el ����ɤ�������ʤ� (require 'skk) �Ǥ�褤���嵭�����
;; ���ϡ�skk-search-prog-list �˻��ꤵ�줿����⤳�λ������ɤ߹����
;; �������롣Emacs �ε�ư���٤��ʤ뤬��SKK ��Ȥ��Ϥ��Ȥ��Υ쥹�ݥ�
;; ���ڲ��ˤʤ롣


;; dired-x �� load ����ȡ��̾� skk �ε�ư�����˻Ȥ��Ƥ��� C-x C-j ��
;; dired-jump ��å���Ƥ��ޤ��� ������򤱤뤿������ꡣ
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            (global-set-key "\C-x\C-j" 'skk-mode)
            ))

;;; dot.emacs ends here
