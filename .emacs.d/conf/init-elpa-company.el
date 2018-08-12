(require 'company)

;すべてのモードで有効にする場合
(global-company-mode)

;特定のモードで有効にする場合(例)
;(add-hook 'python-mode-hook 'company-mode)

;;キーバインディング
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)

;;参考URL https://qiita.com/sune2/items/b73037f9e85962f5afb7
