;;; init-evernote.el --- elisp

;; Copyright (C) 2012  Tsutomu Onoda

;; Author: Tsutomu Onoda <onoben@leo.local.tsutomu.onoda>
;; Keywords: 

    (require 'evernote-mode)
    (setq evernote-username "tsutomuonoda") ; optional: you can use this username as default.;; password:Lowcusic3 
    (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
    (global-set-key "\C-cec" 'evernote-create-note)
    (global-set-key "\C-ceo" 'evernote-open-note)
    (global-set-key "\C-ces" 'evernote-search-notes)
    (global-set-key "\C-ceS" 'evernote-do-saved-search)
    (global-set-key "\C-cew" 'evernote-write-note)
    (global-set-key "\C-cep" 'evernote-post-region)
    (global-set-key "\C-ceb" 'evernote-browser)

;;パスワードをキャシュする
(setq evernote-password-cache t)
