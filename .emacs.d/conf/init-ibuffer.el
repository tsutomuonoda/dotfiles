(message "ibuffer initialization")

;;初期設定
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;;アスタリスクで始まるバッファを隠す
;(require 'ibuf-ext)
;(add-to-list 'ibuffer-never-show-predicates "^\\*")

;; フィルターグループの設定
(setq ibuffer-saved-filter-groups
      '(("home"
	 ("emacs-config" (or (filename . ".emacs.d")
			     (filename . "emacs-config")))
         ("tsutomuonoda.com" (filename . "tsutomuonoda"))
         ("flymeto.info" (filename . "flymeto"))
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("Mail"
	  (or 
	   (mode . wl-folder-mode)
	   (mode . wl-summary-mode)
	   (mode . wl-draft-mode)
	   (mode . mew-summary-mode)
	   (mode . mew-draft-mode)
	   ))
	 ("R" (or 
	       (mode . ess-mode)
	       (filename . "EssMode")))
	 ("LaTeX" 
	    (or 
	     (mode . latex-mode)
	     (filename . "LaTeXMode")))
	 ("Text" (name . ".txt"))
	 ("Programming"
	  (or
	   (mode . c-mode)
	   (mode . perl-mode)
	   (mode . python-mode)
	   (mode . emacs-lisp-mode)
	   ;; etc
	   )) 
	 ("Web Dev" (or (mode . html-mode)
			(mode . css-mode)))
	 ("Dired" (mode . dired-mode))
	 ("Egg" (name . "\*Egg"))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))

;;;その他の有益なオプション

;;空のフィルターグループを隠す
(setq ibuffer-show-empty-filter-groups nil)

;; フック
(add-hook 'ibuffer-mode-hook 
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))


(message "ibuffer mode init loaded")
