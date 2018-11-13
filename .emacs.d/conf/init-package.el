(require 'package)

;;; package-user-dir
(setq package-user-dir "~/.emacs.d/elpa/")

;;; Add package-archives

(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(add-to-list
 'package-archives
 '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; SSL証明書の期限切れのため、セキュリィ警告が出る
;; (add-to-list
;;  'package-archives
;;  '("marmalade" . "https://mamalade-repo.org/packages/"))


;; Initialize
(package-initialize)


