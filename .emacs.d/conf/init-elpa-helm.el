(require 'helm-config)

;;C-x C-bにhelm-for-filesを割り当てる
;(global-set-key (kbd "C-x C-b") 'helm-for-files)
(define-key global-map (kbd "C-x C-b") 'helm-for-files)

;; C-c yにhelm-show-kill-ringを割り当てる
(define-key global-map (kbd "C-c y") 'helm-show-kill-ring)

