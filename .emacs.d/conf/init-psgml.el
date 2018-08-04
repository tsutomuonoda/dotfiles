;;; init-psgml.el --- PSGML Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; psgmlモードの設定                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;; load-path の設定
;(setq load-path
;      (nconc '("/usr/lib/xemacs/xemacs-packages/lisp/psgml")
;	     load-path))
;; auto-load 
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
; サフィックスが .html .htm .sgmlのファイルは ISO-2022-JP にする
;(modify-coding-system-alist 'file "\\.html$"  '(undecided . iso-2022-jp-unix))
;(modify-coding-system-alist 'file "\\.htm$"  '(undecided . iso-2022-jp-unix))
;(modify-coding-system-alist 'file "\\.sgml$"  '(undecided . iso-2022-jp-unix))
		    
;カタログファイルのあるディレクトリ
;(setq sgml-catalog-files  '("CATALOG" "/usr/local/lib/sgml/CATALOG"))	
;(setq sgml-catalog-files  '("CATALOG" "/etc/sgml/catalog"))	
;(setq sgml-ecat-files  '("ECAT" "/usr/local/lib/sgml/ECAT"))	

;; バッファが .html の場合 の設定
(add-hook 'sgml-mode-hook
          (lambda ()
             (if (or (string-match "\\.html$" (buffer-name))
		     (string-match "\\.htm$" (buffer-name)))
;		     (string-match "\\.sgml$" (buffer-name)))
		 (setq sgml-omittag t ;; タグの省略は有効
		       sgml-shorttag nil ;; タグの短縮は無効
		       sgml-omittag-transparent t ;; タグを省略した場合に省略したタグが
                                                ;; 存在するものとしてタグの記述を可能にする
;		       sgml-indent-step nil 
;		       sgml-indent-data nil ;; インデントを行なわない設定にする
		       ))))
;; DOCTYPE 宣言の設定
(setq sgml-custom-dtd
      '(("HTML" "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">")
	("HTML 3.2" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">")
	("HTML 4" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">")
	("HTML 4.01" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">")
	("ANT" "<!DOCTYPE XML PUBLIC \"-//ONOBEN//DTD ANT 1.5.1//EN\">" "~/sgml/ant/ant-1.5.1.dtd")
	("ANT 1.4.1" "<!DOCTYPE XML PUBLIC \"-//ONOBEN//DTD ANT 1.4.1//EN\">" "~/sgml/ant/ant-1.4.1.dtd")
;	("LD" "<!DOCTYPE  LINUXDOC PUBLIC \"-//LinuxDoc//DTD LinuxDoc 96//EN\">")
	))

;;デフォルトのドキュメント構造定義
;(setq htmlhelper-htmldtd-version '("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">") )

;(add-hook 'html-mode-hook 'hm-html-minor-mode)

;; ファイル名が *.html の場合に sgml-mode を呼び出す
;;(setq auto-mode-alist
;;      (cons '("\\.html$" . sgml-mode)
;;	     auto-mode-alist))

;;ハイライト設定
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

;その他の設定
(setq sgml-balanced-tag-edit t);終了タグも挿入する
(setq sgml-auto-insert-required-elements t);挿入されたタグの間で必要とされる要素のためのタグも挿入される
(setq sgml-omittag-transparent nil);終了タグは現在の要素の範囲内で出現できる要素に限定される
(setq sgml-insert-end-tag-on-new-line t);終了タグを開始タグの後に新しい行として挿入する
(setq sgml-insert-missing-element-comment t);内容モデルがある要素を要求しても選ぶ要素が一つもない時、
                                            ;利用可能な選択によって注釈を挿入できる
(setq sgml-live-element-indicator nil);現在の開いている要素の名前をモード行に表示する
                                      ;(注意)この設定はすべてのコマンドを遅くする
(setq sgml-indent-step 3);字下げ幅

;;opensp のための宣言
(setq sgml-declaration "/usr/share/sgml/declaration/html.decl")
