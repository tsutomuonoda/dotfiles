;認証済みaccess tokenをGnuPGで暗号化して保存する
(setq twittering-use-master-password t)

;; xauthで認証する場合
;(setq twittering-auth-method 'xauth)
;(setq twittering-username "TsutomuOnoda")  ; your twitter id
;(setq twittering-password "2106benond")  ; your password

(setq twittering-use-ssl t)
;(setq twittering-auth-method 'oauth)

;CA certificates bundle
;(setq twittering-cert-file "/etc/ssl/certs/ca-certificates.crt")

;(setq twittering-cert-file "/home/onoben/lib/emacs/24/elisp/twittering-mode/cert/GeoTrust_Global_CA.cer")

;(setq twittering-allow-insecure-server-cert t)

;アイコン表示
(setq twittering-icon-mode t)

;タイムラインを5分(300秒)間隔で更新
(setq twittering-timer-interval 300) 

;アイコン取得時の情報表示をデフォルトで抑制
;(setq twittering-url-show-status nil)  
(setq twittering-url-show-status t)  

;アイコン画像を保存する
;(setq twittering-use-icon-storage t)

;全てのアイコンを保存する
;(setq twittering-icon-storage-limit nil)
(setq twittering-icon-storage-limit t)

;最初に開くタイムラインを設定する
(setq twittering-initial-timeline-spec-string
      '(":replies"
        ":favorites"
	":retweets_of_me"
	":home"
	"TsutomuOnoda"
	"TsutomuOnoda/alphabloggers"
	"TsutomuOnoda/sp"
	"TsutomuOnoda/photo"
	"TsutomuOnoda/game"
))

;短縮URLにbit.lyを使う
(setq twittering-tinyurl-service 'bit.ly)
(setq twittering-bitly-login "tsutomuonoda")
(setq twittering-bitly-api-key "R_4880edb06f8b81ddb77d4abf2bb6951d")



