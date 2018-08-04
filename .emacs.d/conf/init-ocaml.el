;;; init-ocaml.el --- ocaml settings

;; Copyright (C) 2012  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: 

;
; settings for ocaml
;

; ocp-indent
(load-file "/usr/share/emacs/site-lisp/ocp-indent.el")


; ocaml-mode
(setq auto-mode-alist
      (cons '("\\.ml[iylp]?$" . caml-mode) auto-mode-alist))
(autoload 'caml-mode "caml" "Major mode for editing Caml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)
(global-set-key "\C-q" 'caml-types-show-type)

; tuareg-mode
(setq auto-mode-alist (cons '("\\.ml[iylp]?$" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

; flymake
(require 'flymake)
(defun flymake-ocaml-init ()
  (flymake-simple-make-init-impl
   'flymake-create-temp-with-folder-structure nil nil
   (file-name-nondirectory buffer-file-name)
   'flymake-get-ocaml-cmdline))
(defun flymake-get-ocaml-cmdline (source base-dir)
  (list "ocaml_flycheck.pl"
	(list source base-dir)))

(push '(".+\\.ml[yilp]?$" flymake-ocaml-init flymake-simple-java-cleanup)
      flymake-allowed-file-name-masks)
(push
 '("^\\(\.+\.ml[yilp]?\\|\.lhs\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)"
   1 2 3 4) flymake-err-line-patterns)

(when (fboundp 'resize-minibuffer-mode) ; for old emacs
  (resize-minibuffer-mode)
  (setq resize-minibuffer-window-exactly nil))

(defun credmp/flymake-display-err-minibuf () 
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
	 (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
	 (count               (length line-err-info-list))
	 )
    (while (> count 0)
      (when line-err-info-list
	(let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
	       (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
	       (text (flymake-ler-text (nth (1- count) line-err-info-list)))
	       (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
	  (message "[%s] %s" line text)
	  )
	)
      (setq count (1- count)))))

(custom-set-faces '(flymake-errline ((((class color)) (:background "LightYellow?" :underline "OrangeRed?")))) '(flymake-warnline ((((class color)) (:background "LightBlue?2" :underline "Yellow")))))


(add-hook
 'tuareg-mode-hook
 '(lambda ()
    (if (not (null buffer-file-name)) (flymake-mode))
    (define-key tuareg-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)
    (define-key tuareg-mode-map "\C-cn" `flymake-goto-next-error)))

; utopをtuareg-modeで使えるようにする。
(add-hook 'tuareg-mode-hook 'utop-minor-mode)


