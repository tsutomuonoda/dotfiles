;;; 22-python.el --- My Python Settings       -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; highlight-indentationの設定
;(add-hook 'python-mode-hook 'highlight-indentation-mode)
(add-hook 'python-mode-hook
	  'highlight-indentation-current-column-mode
	  '(lambda()
	     ;; company-pycomplete.el
	     (setq company-backends '((company-pycomplete)))
	     ;; python-mode.el
	     (setq py-highlight-error-source-p t)
	     (setq py-company-pycomplete-p t)
	     (setq py-tab-indents-region-p t)
	     (setq py-verbose-p t)
	     )
	  )

(provide '22-python) ;;;
;;; 22-python.el ends here


