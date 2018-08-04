(require 'aggressive-indent)

;;;特定のモードでアクティブにする場合
;(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

;;;すべてのモードでアクティブにする場合
(global-aggressive-indent-mode 1)
;その中で例外的に適用したくないモードを明示する
;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)


