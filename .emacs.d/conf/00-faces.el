;;; init-faces.el --- face Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X�ǤΥ��顼ɽ��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'font-lock)
(if (not (featurep 'xemacs))
    (global-font-lock-mode t)
)

;GNOME desktop��ȤäƤ�����Υե��������
;GNOME�Υե��������������ե���Ȥ��ѹ�����й��ߤΥե���Ȥˤʤ롣
;(setq font-use-system-font t)

;Ricty�Υե��������
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

;;�ʲ��ϸŤ����꤬�ĤäƤ���Τ��������롣
;; TrueType�ե���Ȥ�Ȥ����ꡣemacs22
;(setq default-frame-alist
;      (append '((font . "fontset-17")) default-frame-alist))

;; (if (and (eq window-system 'x) (>= emacs-major-version 23))
;; (progn
;; (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-14"))
;; (set-frame-font "Bitstream Vera Sans Mono-14")
;; (set-fontset-font "fontset-default"
;; 'japanese-jisx0208
;; '("�ҥ饮�γѥ� Pro W3-14" . "unicode-bmp"))))

;(when window-system ;comment in
;  (progn ;;comment in
    ;; �ǥե���ȥե���Ȥ�����
     ;; �ե����̾-�ե���ȥ������ǻ��ꤹ�롣
;     (set-frame-font "�ҥ饮�γѥ� Pro W6-14")
;    (set-frame-font "VL �����å�-14")
;        (set-frame-font "Ricty Diminished Discord-16")
;    (set-frame-font "VL �����å�-16") ;comment in
	;;     ;; ���ܸ�(japanese-jisx0208)�ե���Ȥ�����
;	(set-fontset-font ;comment in
;       (frame-parameter nil 'font) ;comment in
;       'japanese-jisx0208 ;comment in
;       '("Ricty Diminished Discord Regular-16" . "unicode-bmp"))
;       '("VL �����å�-16" . "unicode-bmp")) ;comment in


;	(set-fontset-font
;       (frame-parameter nil 'font)
;       'japanese-jisx0208
;       '("�ҥ饮�γѥ� Pro W3-14" . "unicode-bmp"))

    ;; (set-fontset-font
    ;;   (frame-parameter nil 'font)
    ;;    'katakana-jisx0201
    ;;    '("�ҥ饮�γѥ� Pro W3-14" . "unicode-bmp"))

    ;; (set-fontset-font
    ;;   (frame-parameter nil 'font)
    ;;    'ascii
    ;;    '("DejaVu Sans Mono-14" . "unicode-bmp"))

    ;; (set-fontset-font
    ;;   (frame-parameter nil 'font)
    ;;    'unicode
    ;;    '("�ҥ饮�γѥ� Pro W3-14" . "unicode-bmp"))

;     ) ;comment in
;  ) ;comment in

;;�ե���Ȥο��դ��⡼��
;(setq font-lock-support-mode 'jit-lock-mode)

;; no menubar, scrollbar, toolbar or blinky-blinky
(tool-bar-mode nil)
;(menu-bar-mode nil)
(scroll-bar-mode nil)

;;�꡼������ϥ��饤��
(transient-mark-mode t)

;;; �Կ���ɽ��
(setq line-number-mode t)

;; �����ɽ��
(setq column-number-mode t)

;; Show Paren Mode
(show-paren-mode 1)

;;;��̤ο�����������

;; ����� () �ο������
(defvar paren-face 'paren-face)
(make-face 'paren-face)
(set-face-foreground 'paren-face "#88aaff")
  
;; ���� {} �ο������
(defvar brace-face 'brace-face)
(make-face 'brace-face)
(set-face-foreground 'brace-face "#ffaa88")

;; ���� [] �ο������
(defvar bracket-face 'bracket-face)
(make-face 'bracket-face)
(set-face-foreground 'bracket-face "#aaaa00")
  
;; lisp-mode �ο�������ɲ�
(setq lisp-font-lock-keywords-2
      (append '(("(\\|)" . paren-face))
	      lisp-font-lock-keywords-2))
  
;; scheme-mode �ο�������ɲ�
;; (add-hook 'scheme-mode-hook
;; 	  '(lambda ()
;; 	     (setq scheme-font-lock-keywords-2
;; 		   (append '(("(\\|)" . paren-face))
;; 			   scheme-font-lock-keywords-2))))
  
;; c-mode �ο�������ɲ�
;(setq c-font-lock-keywords-3
;      (append '(("(\\|)" . paren-face))
;	      '(("{\\|}" . brace-face))
;	      '(("\\[\\|\\]" . bracket-face))
;	      c-font-lock-keywords-3))

;; ���߹Ԥ˿���Ĥ���
;(global-hl-line-mode 1)
;;��
;(set-face-background 'hl-line "darkolivegreen") 
