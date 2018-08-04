(load "package")


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

; パッケージアーカイブの追加
;(add-to-list 'package-archives 
;'("marmalade" . "http://marmalade-repo.org/packages/") )
;(add-to-list 'package-archives 
;'("melpa" . "http://melpa.milkbox.net/packages/") )

; 初期化
(package-initialize)

; melpa.el
(require 'melpa)



