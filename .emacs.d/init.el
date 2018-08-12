;; Emacs 23������ΥС����������Ѥ��Ƥ�������
;; user-emacs-directory�ѿ���̤����Τ��ἡ��������ɲ�
(when (< emacs-major-version 23)
(defvar user-emacs-directory "~/.emacs.d/")
    )

;; mule-ucs������
;(require 'jisx0213)
;(require 'un-define)


; ---- language-env DON'T MODIFY THIS LINE!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ���ܸ�ɽ��������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;   (if (featurep 'mule)
 ;;       (progn
 ;; 	 (set-language-environment "Japanese")
 ;; 	 (prefer-coding-system 'euc-jp-unix)
 ;; 	 (set-keyboard-coding-system 'euc-jp-unix)
 ;; 	 (if (not window-system) (set-terminal-coding-system 'euc-jp-unix))
 ;; 	 ;;
 ;; 	 ))
 ;; ; ���ܸ� info ��ʸ���������ʤ��褦��
 (auto-compression-mode t)
 ;; ; xemacs �� shell-mode �� ���ܸ� EUC ���Ȥ���褦�ˤ���
 ;; (if (featurep 'xemacs)
 ;;     (add-hook 'shell-mode-hook (function
 ;; 				 (lambda () (set-buffer-process-coding-system 'euc-japan 'euc-japan))))
 ;; )

 ; ���ܸ� grep
 (if (file-exists-p "/usr/bin/lgrep")
     (setq grep-command "lgrep -n ")
   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �����Ѵ� (anthy) ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; anthy.el ����ɤ��롣
;(load-library "anthy")
; japanese-anthy ��ǥե���Ȥ� input-method �ˤ��롣
;(setq default-input-method "japanese-anthy")

;; Emacs 24 snapshot�ǥ��顼�ˤʤ����פʤ餳�ι��ܤϺ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �����Ѵ� (skk) ������ 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-input-method "japanese-skk")
;(toggle-input-method nil)
;; �����ޤǺ���о��ΰ�


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C �ץ����ν�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(defun my-c-mode-common-hook ()
;   (c-set-style "linux") (setq indent-tabs-mode t) ;linux ���������Ȥ�
;      /usr/src/linux/Documentation/CodingStyle ����
;   (c-set-style "k&r") ;k&r���������Ȥ��Ϥ����ͭ���ˤ���
;   (c-set-style "gnu") ;�ǥե���Ȥ�����
; )
;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Delete�����ǥ���������֤�ʸ�����ä���褦�ˤ���
;; (global-set-key [delete] 'delete-char)
;; C-h �����ǥ�������κ���ʸ�����ä���褦�ˤ��롣
;; ����������Ȥ�� C-h �ϥإ�פʤΤǡ�
;; �����ͭ���ˤ���ȡ��إ�פ�Ȥ��Ȥ��ˤ�
;; M-x help �� F1 ��Ȥ�ɬ�פ�����ޤ���
;(global-set-key "\C-h" 'backward-delete-char)

; ---- language-env end DON'T MODIFY THIS LINE!

;;;;;;;;;;;;;;;;;;;
;;Personal Setting
;;;;;;;;;;;;;;;;;;;;



;;
;; Global Key Bindings
;;


;;; �������ե�����λ���
;;; �����ǻ��ꤷ���ե�����˥��ץ�������������񤭹��ޤ�ޤ�

;(setq user-init-file "~/.emacs_init.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;�ޥ��������ѥ�������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add-to-load-path�ؿ����������
;; ������load-path���ɲä���
;; ���ΥС������ϥ��֥ǥ��쥯�ȥ�ϼ�ưŪ�˥��ɥѥ����ɲä��Ƥ���ʤ���
;; �⤷�����Τ褦�ʥ����ɤ�ɬ�פǤ���Сּ��������p.61�פ򸫤뤳�ȡ�
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
	   (add-to-list 'load-path path))
	(mapcar 'expand-file-name paths))) ;;�����Ƶ����Ƥ���褦�˸�����Lisp�ٶ�������֥����ɲä��롣

;
;; elisp������ե�����Υǥ��쥯�ȥ��load-path���ɲ�
(add-to-load-path "~/.emacs.d/elisp"
                  ;;org2blog��Emacs24Ʊ����8.2.10���б��Ǥ��Ƥ��뤬��
		  ;;org-mode�ѥå�������(9.0.3)�ˤ��б��Ǥ��Ƥ��ʤ���
		  "~/.emacs.d/elisp/metaweblog/";;ver:0.1.1
		  "~/.emacs.d/elisp/org2blog/";; ver:0.9.2
;		  "~/.emacs.d/elisp/egg/"
;		  "~/.emacs.d/elisp/yasnippet/"
		  "~/.emacs.d/elisp/clojure-mode/"
;		  "~/.emacs.d/elisp/elpa/"
;		  "~/.emacs.d/elisp/melpa/"
;		  "~/.emacs.d/elisp/helm/" ;;�ѥå�����������ΤǤ���������ꤹ�롣
;		  "/home/onoben/lib/emacs/24/elisp/ddskk-20130421/share/emacs/site-lisp/skk"
;		  "~/.emacs.d/elisp/twittering-mode-3.0.0/"
;		  "~/.emacs.d/elisp/twittering-mode-2.0.0/"
;		  "~/.emacs.d/elisp/twittering-mode/" ;;�ѥå�����������ΤǤ���������ꤹ�롣
;		  "~/.emacs.d/elisp/nrepl.el/"
;		  "~/.emacs.d/elisp/ritz/nrepl/elisp/"
;		  "~/.emacs.d/elisp/scala-mode/";;�ѥå�����������ΤǤ���������ꤹ�롣
;		  "~/.emacs.d/elisp/scala-mode2/";;�ѥå�����������ΤǤ���������ꤹ�롣
;		  "~/.emacs.d/elisp/ensime_2.9.2-0.9.8.9/elisp/"
;		  "~/.emacs.d/elisp/flycheck/"
;		  "~/.emacs.d/elisp/golang-mode/";;�ѥå�����������ΤǤ���������ꤹ�롣
;		  "~/.emacs.d/elisp/mule-ucs/lisp/jisx0213"
;		  "~/.emacs.d/elisp/mule-ucs/lisp"
		  "~/.emacs.d/conf")

;(setq load-path (append '("~/lib/emacs/22.1.1/elisp") load-path))

;;�ѥå����������ƥ�
;(require 'package)

; Add package-archives
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

; Initialize
;(package-initialize)

; melpa.el
;(require 'melpa)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WEMI (widget ɽ������ SEMI);;�֥�̤���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'mime-setup)
;(load "path-util")
;(setq rmail-enable-mime t)

;; rail-1.0.2 ��Ȥä� User-Agent: �ե�����ɤΥ����ɥ͡�������ܸ첽����
;(setq rail-emulate-genjis t)
;(if (module-installed-p 'rail) (load "rail"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; namazu.el������
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(autoload 'namazu "namazu" nil t)
;(setq browse-url-browser-function 'w3m-browse-url)

;(setq namazu-dir-alist
;      '(("jf" . "/var/local/lib/namazu/index/JF/")
;	("ldp" . "/var/local/lib/namazu/index/LDP/")
;	("lj" . "/var/local/lib/namazu/index/LJ/")
;	("lg" . "/var/local/lib/namazu/index/LG/")
;	("hp" . "/var/local/lib/namazu/index/HP/")
;	("gnu" . "/var/local/lib/namazu/index/GNU/")
;	("mlja" . "/var/local/lib/namazu/index/MLJA/")
;	("mlen" . "/var/local/lib/namazu/index/MLEN/")
;	("doccd99" . "/var/local/lib/namazu/index/Doc-CD-1999-f/")
;	("doccd00" . "/var/local/lib/namazu/index/Doc-CD-2000-s/")
;	("doccd01" . "/var/local/lib/namazu/index/Doc-CD-2001-s/")
;	("usrdoc" . "/var/local/lib/namazu/index/UsrDoc/")
;	("lglocal" . "/var/local/lib/namazu/index/LGLOCAL/")
;	("localdoc" . "/var/local/lib/namazu/index/LocalDoc/")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; info �ǥ��쥯�ȥ�
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; old settings
;(setq Info-additional-directory-list '("/usr/share/info"))
;(setq Info-default-directory-list
;      (append '("/home/onoben/info") Info-default-directory-list))


; Info�ǥ��쥯�ȥ��ɲ�����
; �����ƥ�ͥ��
;(setq Info-directory-list
;     (append Info-directory-list (list (expand-file-name "~/info"))))

; �Ŀ�ͥ��
;(setq Info-directory-list
;      (cons (expand-file-name "~/info") Info-directory-list ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; for semantic
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq semantic-load-turn-everything-on t)
;(require 'semantic-load)
;(setq semanticdb-default-save-directory "/home/onoben/.emacs.d/semantic-cache")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; for CEDET
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn on CEDET's fun parts
;(setq semantic-load-turn-useful-things-on t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; for speedbar
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;(global-set-key [(f4)] 'speedbar-get-focus)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; for emacs code browser (ecb)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'ecb)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; JDE Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; If you want Emacs to defer loading the JDE until you open a 
;; Java file, edit the following line
;(setq defer-loading-jde nil)
;; to read:
;;
;;  (setq defer-loading-jde t)
;;

;; (if defer-loading-jde
;;     (progn
;;       (autoload 'jde-mode "jde" "jde mode(Java Development Environment)." t)
;;       (setq auto-mode-alist
;; 	    (append
;; 	     '(("\\.java$" . jde-mode))
;; 	     auto-mode-alist)))
;;   (require 'jde)
;;   (require 'jde-ant))


;; ;; Sets the basic indentation for Java source files
;; ;; to two spaces.
;; (defun my-jde-mode-hook ()
;; ;;	     (gtags-mode 1)	   ;;java-mode�Ǽ�ư��gtags-mode������
;;   (setq c-basic-offset 2))

;; (add-hook 'jde-mode-hook 'my-jde-mode-hook)


;; (define-key java-mode-map "\C-c\C-vc"
;;   'jde-import-kill-extra-imports) ;;���פ�importʸ����

;; (setq browse-url-new-window-p t) ;;w3m�ǥɥ�����Ȥ�ɽ��

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MMM Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'mmm-mode)
;(setq mmm-global-mode 'maybe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; gtags Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(autoload 'gtags-mode "gtags" "" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; oo-browser Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load "br-start")
;;(global-set-key "\C-c\C-o" 'oo-browser)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; xcscope Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(require 'xcscope)

;;(setq cscope-database-regexps
;;      '(
;;	( "^/home/onoben/src/java" 
;;	( t )
;;	( "/home/onoben/tmp" )
;;	t
;;	))
;;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; mailcrypt 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(load-library "mailcrypt")
;(mc-setversion "gpg")
;(autoload 'mc-install-write-mode "mailcrypt" nil t)
;(autoload 'mc-install-read-mode "mailcrypt" nil t)
;(add-hook 'mail-mode-hook 'mc-install-write-mode)

;; for wanderlust
;(add-hook 'wl-summary-mode-hook 'mc-install-read-mode)
;(add-hook 'wl-mail-setup-hook 'mc-install-write-mode)
;(defun mc-wl-verify-signature ()
;  (interactive)
;  (save-window-excursion
;    (wl-summary-jump-to-current-message)
;    (mc-verify)))
;(defun mc-wl-decrypt-message ()
;  (interactive)
;  (save-window-excursion
;    (wl-summary-jump-to-current-message)
;    (let ((inhibit-read-only t))
;      (mc-decrypt-message))))
;(eval-after-load "mailcrypt"
;  '(setq mc-modes-alist
;	 (append
;	  (quote
;	   ((wl-draft-mode (encrypt . mc-encrypt-message)
;			   (sign . mc-sign-message))
;	    (wl-summary-mode (decrypt . mc-wl-decrypt-message)
;			     (verify . mc-wl-verify-signature))))
;	  mc-modes-alist)))


;;kill-summary
;(autoload 'kill-summary "kill-summary" nil t)
;(global-set-key (kbd "C-c y") 'kill-summary)




;;; navi2ch
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)

;;; brose-kill-ring
;; helm-show-kill-ring��Ȥ����ᥳ���ȥ����Ȥ�����
;; (require 'browse-kill-ring)

;;  (global-set-key (kbd "C-c y") 'browse-kill-ring)

;;  (defadvice yank-pop (around kill-ring-browse-maybe (arg))
;;    "If last action was not a yank, run `browse-kill-ring' instead."
;;    (if (not (eq last-command 'yank))
;;        (browse-kill-ring)
;;      ad-do-it))

;;  (ad-activate 'yank-pop)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ccs mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'css-mode "css-mode")
(setq auto-mode-alist       
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))

 ;����ǥ�Ȥ�c-style�ˤ��� 
(setq cssm-indent-function #'cssm-c-style-indenter)

;;; generic mode ; �֥�̤���
;;(require 'generic-x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mu-cite
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mu-cite-original "mu-cite" nil t)
;; for all but message-mode
(add-hook 'mail-citation-hook 'mu-cite-original)
;; for message-mode only
;(setq message-cite-function 'mu-cite-original)

;;; php-mode
;(require 'php-mode)
;(add-hook 'php-mode-user-hook 'turn-on-font-lock)
;(add-hook 'php-mode-user-hook
;	  '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;;; autoinsert.el ;;�֥�̤���
(add-hook 'find-file-hooks 'auto-insert)
(auto-insert-mode 1)
(setq auto-insert-directory "~/src/insert")
(setq auto-insert-alist
      (cons '(cperl-mode . "cperl_insert.pl") auto-insert-alist))

;;; mode-info
;(require 'mi-config)
;(require 'mi-fontify)
;(global-set-key "\C-hf" 'mode-info-describe-function)
;(global-set-key "\C-hv" 'mode-info-describe-variable)
;(global-set-key "\M-." 'mode-info-find-tag)

;;; migemo
;;(load-library "migemo")


;;; T-gnus
;(load "gnus-setup")
;(require 't-gnus-startup)

;;; Mew
;     (autoload 'mew "mew" nil t)
;     (autoload 'mew-send "mew" nil t)

     ;; Optional setup (Read Mail menu):
;     (setq read-mail-command 'mew)

     ;; Optional setup (e.g. C-xm for sending a message):
     ;; (autoload 'mew-user-agent-compose "mew" nil t)
     ;; (if (boundp 'mail-user-agent)
     ;; 	 (setq mail-user-agent 'mew-user-agent))
     ;; (if (fboundp 'define-mail-user-agent)
     ;; 	 (define-mail-user-agent
     ;; 	   'mew-user-agent
     ;; 	   'mew-user-agent-compose
     ;; 	   'mew-draft-send-message
     ;; 	   'mew-draft-kill
     ;; 	   'mew-send-hook))

;;framepop.el
;(when window-system
;  (require 'framepop)
;  (framepop-enable))

;; ibuffer.el ;;�֥�̤���
(global-font-lock-mode 1)
(require 'ibuffer)

;; lcomp.el
;(require 'lcomp)
;(lcomp-mode 1)
;(lcomp-keys-mode 1)
;(lcomp-activate-advices t)

;; marker-visit.el
;(require 'marker-visit)


;; org mode
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

; �����ɥ֥�å��Υ������˿����դ���
(setq org-src-fontify-natively t)

;; �ʲ���6.0x���Τ��
;; (autoload 'org-mode "org" "Org mode" t)
;; (autoload 'org-diary "org" "Diary entries from Org mode")
;; (autoload 'org-agenda "org" "Multi-file agenda from Org mode" t)
;; (autoload 'org-store-link "org" "Store a link to the current location" t)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)


;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

;;; aspell
(setq-default ispell-program-name "aspell") 
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;;;The Emacs-Goodies-el Package Setup

;(setq emacs-goodies-el-defaults t)


;;;�ܤ�����info�򻲾Ȥ��롣
;;align-string::                Align string components over several lines;;�褯�狼��ʤ���

;;auto-fill-inhibit-list'.�ޤ�����Ū�פ��դ��ʤ���

;;(require 'bar-cursor);;�٤����Ǹ����ʤ����㤭
;;(bar-cursor-mode 1);;
;;�����Υѥå��������鸫�롣
;;browse-huge-tar::             Browse files in a tarball memory-efficiently

;;;Haskell mode
;50haskell-mode.el�ˤ�'turn-on-haskell-indent�������
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)

(setq haskell-literate-default 'latex)
(setq haskell-doc-idle-delay 0)


;;PATH
(setq exec-path (cons "/usr/local/texlive/p2009/bin/i686-pc-linux-gnu" exec-path))
(setenv "PATH"
	(concat '"/usr/local/texlive/p2009/bin/i686-pc-linux-gnu:" (getenv "PATH")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   twittering-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'twittering-mode)



;��ʸ�����¹Ի��γ�ǧ��̵����
;(put 'downcase-region 'disabled nil)

;;�ǽ�˵�ư���� emacs �� server �ˤ���
;(require 'server)
;     (unless (server-running-p) (server-start))

;; xml-rpc
;(require 'xml-rpc)

;; netrc
;(require 'netrc)

;; org2blog ;��Ƥ˼��Ԥ���Τ�̵���ˤ��Ƥ�����
;(require 'org2blog-autoloads)

;(setq blog (netrc-machine (netrc-parse "~/.netrc") "toblog" t))


;; org2blog mode hook
;(add-hook 'org2blog/wp-mode-hook
;	  (lambda ()
;	    (require 'skk)
;	    (setq skk-kutouten-type 'en);;org2blog �ΤȤ��������������ѹ����롣
;	    (auto-fill-mode -1);;�����ȥե����off�ˤ��롣
;	    ))

;; ido-mode
;(require 'ido)
;(ido-mode t)

;;yasnippet
;(require 'yasnippet)
;(yas-global-mode 1)

;; speck-mode
(require 'speck)
(setq speck-engine (quote Hunspell))
(setq speck-hunspell-language-options
      (quote (("da" utf-8 nil t nil)
              ("de" iso-8859-1 nil t nil)
              ("en" utf-8 nil nil nil)
              ("fr" iso-8859-1 nil nil nil)
              ("it" iso-8859-1 nil nil nil)
              ("ru" koi8-r nil nil nil))))
(setq speck-hunspell-program "/usr/bin/hunspell")
(setq speck-hunspell-library-directory "/usr/share/hunspell/")
(setq speck-hunspell-default-dictionary-name "en_US")

;; PATH������
;; ��겼�˵��Ҥ���ʪ�� PATH ����Ƭ���ɲä���ޤ�
(dolist (dir (list
              "/bin"
              "/usr/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.rvm/bin")
	      "/usr/local/texlive/2011/bin/i386-linux"
              ))
 ;; PATH �� exec-path ��Ʊ��ʪ���ɲä��ޤ�
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))


;; clojure-mode
(require 'clojure-mode)

;; nrepl
;(require 'nrepl)

;; nrepl-ritz
;(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
;(defun my-nrepl-mode-setup ()
;  (require 'nrepl-ritz))

;; ESS
;(require 'ess-site)

;; scala-mode
;(require 'scala-mode-auto)
;(require 'scala-mode-feature-electric)

;(setq yas/scala-directory "~/lib/emacs/24/elisp/yasnippet/snippets/scala-mode")
;(yas/load-directory yas/scala-directory)

;(add-hook 'scala-mode-hook
;	  '(lambda ()
;	     (scala-electric-mode)
;	     (yas/minor-mode-on)
;	     ))

;; scala-mode2
;(require 'scala-mode2)

; ���Ԥȥ���ǥ�ȡ���Ϣ�롤�Хå�����

(add-hook 'scala-mode-hook '(lambda ()

  ;; Bind the 'newline-and-indent' command to RET (aka 'enter'). This
  ;; is normally also available as C-j. The 'newline-and-indent'
  ;; command has the following functionality: 1) it removes trailing
  ;; whitespace from the current line, 2) it create a new line, and 3)
  ;; indents it.  An alternative is the
  ;; 'reindent-then-newline-and-indent' command.
  (local-set-key (kbd "RET") 'newline-and-indent)

  ;; Alternatively, bind the 'newline-and-indent' command and
  ;; 'scala-indent:insert-asterisk-on-multiline-comment' to RET in
  ;; order to get indentation and asterisk-insertion within multi-line
  ;; comments.
  ;; (local-set-key (kbd "RET") '(lambda ()
  ;;   (interactive)
  ;;   (newline-and-indent)
  ;;   (scala-indent:insert-asterisk-on-multiline-comment)))

  ;; Bind the 'join-line' command to C-M-j. This command is normally
  ;; bound to M-^ which is hard to access, especially on some European
  ;; keyboards. The 'join-line' command has the effect or joining the
  ;; current line with the previous while fixing whitespace at the
  ;; joint.
  (local-set-key (kbd "C-M-j") 'join-line)

  ;; Bind the backtab (shift tab) to
  ;; 'scala-indent:indent-with-reluctant-strategy command. This is usefull
  ;; when using the 'eager' mode by default and you want to "outdent" a
  ;; code line as a new statement.
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)

  ;; and other bindings here
))

;�ۥ磻�ȥ��ڡ���
;��Ŭ���ʥۥ磻�ȥ��ڡ�����ϥ��饤�Ȥ���
;��¸�������פʥۥ磻�ȥ��ڡ��������������ꡥ

(add-hook 'scala-mode-hook '(lambda ()
  (require 'whitespace)

  ;; clean-up whitespace at save
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook 'whitespace-cleanup)

  ;; turn on highlight. To configure what is highlighted, customize
  ;; the *whitespace-style* variable. A sane set of things to
  ;; highlight is: face, tabs, trailing
  (whitespace-mode)
))

;(setq yas/scala-directory "~/lib/emacs/24/elisp/yasnippet/snippets/scala-mode")
;(yas/load-directory yas/scala-directory)

;(add-hook 'scala-mode-hook
;	  '(lambda ()
;	     (yas/minor-mode-on)
;	     ))


;; ensime
;(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; flycheck 
;(require 'flycheck)

;; Go Lang��flycheck��Ȥ�����
;(add-hook 'go-mode-hook 'flycheck-mode)

;; SDIC������
(global-set-key "\C-cw" 'sdic-describe-word)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; newsticker
(add-hook 'newsticker-mode-hook 'imenu-add-menubar-index)

;; howm������(��ư���ʤ��Τ�����)
;(setq howm-menu-lang 'ja)
;(require 'howm)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "~/.emacs25.d/el-get/el-get")

;; (unless (require 'el-get nil t)
;;   (url-retrieve
;;    "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;    (lambda (s)
;;      (end-of-buffer)
;;      (eval-print-last-sexp))))

;; ;; now either el-get is `require'd already, or have been `load'ed by the
;; ;; el-get installer.
;; (setq
;;  el-get-sources
;;  '(el-get				; el-get is self-hosting
;;    escreen            			; screen for emacs, C-\ C-h
;;    php-mode-improved			; if you're into php...
;;    switch-window			; takes over C-x o
;;    auto-complete			; complete as you type with overlays
;;    zencoding-mode			; http://www.emacswiki.org/emacs/ZenCoding

;;    (:name buffer-move			; have to add your own keys
;; 	  :after (lambda ()
;; 		   (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; 		   (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; 		   (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; 		   (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

;;    (:name smex				; a better (ido like) M-x
;; 	  :after (lambda ()
;; 		   (setq smex-save-file "~/.emacs25.d/.smex-items")
;; 		   (global-set-key (kbd "M-x") 'smex)
;; 		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

;;    (:name magit				; git meet emacs, and a binding
;; 	  :after (lambda ()
;; 		   (global-set-key (kbd "C-x C-z") 'magit-status)))

;;    (:name goto-last-change		; move pointer back to last change
;; 	  :after (lambda ()
;; 		   ;; when using AZERTY keyboard, consider C-x C-_
;; 		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

;; (unless (string-match "apple-darwin" system-configuration)
;;   (loop for p in '(color-theme		; nice looking emacs
;; 		   color-theme-tango	; check out color-theme-solarized
;; 		   )
;; 	do (add-to-list 'el-get-sources p)))

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
;(when (el-get-executable-find "cvs")
;  (add-to-list 'el-get-sources 'emacs-goodies-el)) ; the debian addons for emacs

;(when (el-get-executable-find "svn")
;  (loop for p in '(psvn    		; M-x svn-status
;		   yasnippet		; powerful snippet mode
;		   )
;	do (add-to-list 'el-get-sources p)))

;; install new packages and init already installed packages
;(el-get 'sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �����֥֥饦���Ȥ�Ϣ��(Chromium��ɽ���Ǥ�����֥��˽�)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key [S-mouse-2] 'browse-url-at-mouse)

;;; Go Lang
;(require 'go-mode-load)

;(setq browse-url-generic-program (executable-find "chromium")
;          browse-url-browser-function 'browse-url-generic)

;(setq browse-url-browser-function 'browse-url-generic
;          browse-url-generic-program "/usr/bin/chromium")
;          browse-url-generic-program "chromium")

;(setq browse-url-browser-function 'browse-url-firefox
;          browse-url-new-window-flag  t
;          browse-url-firefox-new-window-is-tab t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-load.el������
;; 0��9:Emacs�Ķ����Τν����
;; 10����:�����ǥ��󥰤δ��פˤʤ�����饤�֥�꡿�ե졼����������
;; 20����:�Ƽ�ץ���ߥ��ѥ⡼�ɤ�����
;; 30����:�Ƽ�ʸ������ѥ⡼�ɤ�����
;; 80����:�Ƽ磻�󥿡��ͥåȥ��ץꥱ������������
;; 90����:��¸�ط�������ʤ����ץꥱ������������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;;����ե������ɤ߹���
 ; (load "init-colorthemes")
;(load "init-emacsbible")
;  (load "init-evernote")
;  (load "init-gde")
;  (load "init-lsdb")
;  (load "init-psgml")
;  (load "init-ruby")
 ;(load "init-scm")
;  (load "init-tdiary")
; (load "init-typescript")
;  (load "init-ocaml")

;; helm-for-files��Ȥ����ᥳ���ȥ����Ȥ���
;(load "init-ibuffer")

;(load "init-egg")
;(load "init-melpa")
;(load "init-howm")
(load "init-elpa-highlight-indentation")
(load "init-haml-elisp")
(load "init-elpa-ace-link")
;(load "init-elpa-aggressive-indent")
(load "init-elpa-beacon")
;(load "init-elpa-clues-theme")
(load "init-elpa-company")
(load "init-elpa-helm")
;(load "init-elpa-undo-tree")


;;; ������������ե�����λ���
;;; �����ǻ��ꤷ���ե�����˥����������������񤭹��ޤ�ޤ�
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))



