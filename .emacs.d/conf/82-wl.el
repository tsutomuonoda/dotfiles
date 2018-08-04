;;; init-wl.el --- Wanderlust Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: mail, 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wanderlust 2.15.9
;;   IMAP �ˤ��б������᡼��/�˥塼���꡼��
;;   �����ˤ�'.emacs'�ե�����˵��Ҥ������������񤭤ޤ���
;;   �����ʳ�������� ~/.wl �ǹԤ��ޤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; autoload ������
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; �ʲ���README.Debian�˽񤤤Ƥ���Wanderlust��ǥե���Ȥ�
;; �᡼��ˤ�������Ǥ���

(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (boundp 'read-mail-command)
    (setq read-mail-command 'wl))


;; �ʲ���info�˽񤤤Ƥ�������Ǥ���README.Debian�ε��Ҥ��ɲä���
;; ���˥����ȥ��󤷤ޤ����� 
;mail-user-agent(C-x m(`compose-mail') �ǥɥ�եȥ⡼�ɤ�ư)
;; (autoload 'wl-user-agent-compose "wl-draft" nil t)

;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'wl-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'wl-user-agent
;;       'wl-user-agent-compose
;;       'wl-draft-send
;;       'wl-draft-kill
;;       'mail-send-hook))

;; gnutls.el������(README.Debian�򻲾�)
(setq gnutls-verify-error t)
(setq gnutls-algorithm-priority "SECURE:-VERS-SSL3.0")

;; �嵭��gnutls.el��������ɲä������������ȥ��󤷤ޤ�����
;; �⤷��˥󥰤��Ф�褦�Ǥ���Х����ȥ����Ȥ��Ƥ���������
;; gnutls�Υ�˥��к�
;; �� http://comments.gmane.org/gmane.emacs.gnus.general/83413
;(setq gnutls-min-prime-bits 1024)
