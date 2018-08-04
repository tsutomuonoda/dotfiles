;;; init-wl.el --- Wanderlust Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: mail, 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wanderlust 2.15.9
;;   IMAP にも対応したメール/ニュースリーダ
;;   ここには'.emacs'ファイルに記述する設定だけを書きます。
;;   これら以外の設定は ~/.wl で行います。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; autoload の設定
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; 以下はREADME.Debianに書いてあるWanderlustをデフォルトの
;; メーラにする設定です。

(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (boundp 'read-mail-command)
    (setq read-mail-command 'wl))


;; 以下はinfoに書いてある設定です。README.Debianの記述を追加した
;; 時にコメントインしました。 
;mail-user-agent(C-x m(`compose-mail') でドラフトモードを起動)
;; (autoload 'wl-user-agent-compose "wl-draft" nil t)

;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'wl-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'wl-user-agent
;;       'wl-user-agent-compose
;;       'wl-draft-send
;;       'wl-draft-kill
;;       'mail-send-hook))

;; gnutls.elの設定(README.Debianを参照)
(setq gnutls-verify-error t)
(setq gnutls-algorithm-priority "SECURE:-VERS-SSL3.0")

;; 上記のgnutls.elの設定を追加した時、コメントインしました。
;; もしワーニングが出るようであればコメントアウトしてください。
;; gnutlsのワーニング対策
;; ⇒ http://comments.gmane.org/gmane.emacs.gnus.general/83413
;(setq gnutls-min-prime-bits 1024)
