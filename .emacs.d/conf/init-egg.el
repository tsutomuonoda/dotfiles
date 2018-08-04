;; Egg(Emacs Got Git)
(require 'egg)

;;; git commit したときのバッファを utf-8 にする
(add-hook 'server-visit-hook
	  (function (lambda ()
		      (if (string-match "COMMIT_EDITMSG" buffer-file-name)
			  (set-buffer-file-coding-system 'utf-8)))))

