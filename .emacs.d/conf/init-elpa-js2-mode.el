
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;;js2-imenu-extras.el
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
