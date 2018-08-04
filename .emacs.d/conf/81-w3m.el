;;; init-w3m.el --- emacs-w3m Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; emacs-w3m の設定
;;; (Please read /usr/share/doc/w3m-el/)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)

;;; for brose-url
(setq browse-url-browser-function 'w3m-browse-url)

(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)

;;; for dired
(add-hook 'dired-mode-hook
	  (lambda ()
	    (define-key dired-mode-map "\C-xm" 'dired-w3m-find-file)))
(defun dired-w3m-find-file ()
  (interactive)
  (require 'w3m)
  (let ((file (dired-get-filename)))
    (if (y-or-n-p (format "Open 'w3m' %s " (file-name-nondirectory file)))
	(w3m-find-file file))))

;;; w3m-namazu の設定

(setq w3m-namazu-index-alist
      '(("jf" "/home/onoben/var/namazu/index/usr_share_doc_HOWTO_ja")
	("ldp" "/home/onoben/var/namazu/index/usr_share_doc_HOWTO_en")
	("doc" "/home/onoben/var/namazu/index/usr_share_doc")
;	("lj" "/var/local/lib/namazu/index/LJ")
;	("lg" "/var/local/lib/namazu/index/LG")
;	("hp" "/var/local/lib/namazu/index/HP")
;	("gnu" "/var/local/lib/namazu/index/GNU")
;	("mlja" "/var/local/lib/namazu/index/MLJA")
;	("mlen" "/var/local/lib/namazu/index/MLEN")
;	("doccd99" "/var/local/lib/namazu/index/Doc-CD-1999-f")
;	("doccd00" "/var/local/lib/namazu/index/Doc-CD-2000-s")
;	("doccd01" "/var/local/lib/namazu/index/Doc-CD-2001-s")
;	("lglocal" "/var/local/lib/namazu/index/LGLOCAL")
;	("java" "/var/local/lib/namazu/index/java")
;	("localdoc" "/var/local/lib/namazu/index/LocalDoc")
))


;(setq w3m-namazu-default-index "jf")

(define-key global-map
	   "\C-cN" 'w3m-namazu) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  w3m-perldoc mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'w3m-perldoc "w3m-perldoc"        
   "View Perl documents" t)                  
