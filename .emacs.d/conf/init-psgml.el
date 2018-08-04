;;; init-psgml.el --- PSGML Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; psgml�⡼�ɤ�����                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;; load-path ������
;(setq load-path
;      (nconc '("/usr/lib/xemacs/xemacs-packages/lisp/psgml")
;	     load-path))
;; auto-load 
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
; ���ե��å����� .html .htm .sgml�Υե������ ISO-2022-JP �ˤ���
;(modify-coding-system-alist 'file "\\.html$"  '(undecided . iso-2022-jp-unix))
;(modify-coding-system-alist 'file "\\.htm$"  '(undecided . iso-2022-jp-unix))
;(modify-coding-system-alist 'file "\\.sgml$"  '(undecided . iso-2022-jp-unix))
		    
;�������ե�����Τ���ǥ��쥯�ȥ�
;(setq sgml-catalog-files  '("CATALOG" "/usr/local/lib/sgml/CATALOG"))	
;(setq sgml-catalog-files  '("CATALOG" "/etc/sgml/catalog"))	
;(setq sgml-ecat-files  '("ECAT" "/usr/local/lib/sgml/ECAT"))	

;; �Хåե��� .html �ξ�� ������
(add-hook 'sgml-mode-hook
          (lambda ()
             (if (or (string-match "\\.html$" (buffer-name))
		     (string-match "\\.htm$" (buffer-name)))
;		     (string-match "\\.sgml$" (buffer-name)))
		 (setq sgml-omittag t ;; �����ξ�ά��ͭ��
		       sgml-shorttag nil ;; ������û�̤�̵��
		       sgml-omittag-transparent t ;; �������ά�������˾�ά����������
                                                ;; ¸�ߤ����ΤȤ��ƥ����ε��Ҥ��ǽ�ˤ���
;		       sgml-indent-step nil 
;		       sgml-indent-data nil ;; ����ǥ�Ȥ�Ԥʤ�ʤ�����ˤ���
		       ))))
;; DOCTYPE ���������
(setq sgml-custom-dtd
      '(("HTML" "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">")
	("HTML 3.2" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">")
	("HTML 4" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">")
	("HTML 4.01" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">")
	("ANT" "<!DOCTYPE XML PUBLIC \"-//ONOBEN//DTD ANT 1.5.1//EN\">" "~/sgml/ant/ant-1.5.1.dtd")
	("ANT 1.4.1" "<!DOCTYPE XML PUBLIC \"-//ONOBEN//DTD ANT 1.4.1//EN\">" "~/sgml/ant/ant-1.4.1.dtd")
;	("LD" "<!DOCTYPE  LINUXDOC PUBLIC \"-//LinuxDoc//DTD LinuxDoc 96//EN\">")
	))

;;�ǥե���ȤΥɥ�����ȹ�¤���
;(setq htmlhelper-htmldtd-version '("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">") )

;(add-hook 'html-mode-hook 'hm-html-minor-mode)

;; �ե�����̾�� *.html �ξ��� sgml-mode ��ƤӽФ�
;;(setq auto-mode-alist
;;      (cons '("\\.html$" . sgml-mode)
;;	     auto-mode-alist))

;;�ϥ��饤������
(setq sgml-set-face t)
;;
;; Faces.
;;
(make-face 'sgml-comment-face)
(make-face 'sgml-doctype-face)
(make-face 'sgml-end-tag-face)
(make-face 'sgml-entity-face)
(make-face 'sgml-ignored-face)
(make-face 'sgml-ms-end-face)
(make-face 'sgml-ms-start-face)
(make-face 'sgml-pi-face)
(make-face 'sgml-sgml-face)
(make-face 'sgml-short-ref-face)
(make-face 'sgml-start-tag-face)

(set-face-foreground 'sgml-comment-face "red2")
(set-face-foreground 'sgml-doctype-face "maroon")
(set-face-foreground 'sgml-end-tag-face "blue2")
(set-face-foreground 'sgml-entity-face "red2")
(set-face-foreground 'sgml-ignored-face "maroon")
(set-face-background 'sgml-ignored-face "gray90")
(set-face-foreground 'sgml-ms-end-face "orange")
(set-face-foreground 'sgml-ms-start-face "orange")
(set-face-foreground 'sgml-pi-face "darkgreen")
(set-face-foreground 'sgml-sgml-face "pink")
(set-face-foreground 'sgml-short-ref-face "purple")
(set-face-foreground 'sgml-start-tag-face "blue2")

(setq sgml-markup-faces
	      '((comment . sgml-comment-face)
		(doctype . sgml-doctype-face)
		(end-tag . sgml-end-tag-face)
		(entity . sgml-entity-face)
		(ignored . sgml-ignored-face)
		(ms-end . sgml-ms-end-face)
		(ms-start . sgml-ms-start-face)
		(pi . sgml-pi-face)
		(sgml . sgml-sgml-face)
		(shortref . sgml-short-ref-face)
		(start-tag . sgml-start-tag-face)))

;����¾������
(setq sgml-balanced-tag-edit t);��λ��������������
(setq sgml-auto-insert-required-elements t);�������줿�����δ֤�ɬ�פȤ�������ǤΤ���Υ��������������
(setq sgml-omittag-transparent nil);��λ�����ϸ��ߤ����Ǥ��ϰ���ǽи��Ǥ������Ǥ˸��ꤵ���
(setq sgml-insert-end-tag-on-new-line t);��λ�����򳫻ϥ����θ�˿������ԤȤ�����������
(setq sgml-insert-missing-element-comment t);���ƥ�ǥ뤬�������Ǥ��׵ᤷ�Ƥ��������Ǥ���Ĥ�ʤ�����
                                            ;���Ѳ�ǽ������ˤ�ä����������Ǥ���
(setq sgml-live-element-indicator nil);���ߤγ����Ƥ������Ǥ�̾����⡼�ɹԤ�ɽ������
                                      ;(���)��������Ϥ��٤ƤΥ��ޥ�ɤ��٤�����
(setq sgml-indent-step 3);��������

;;opensp �Τ�������
(setq sgml-declaration "/usr/share/sgml/declaration/html.decl")
