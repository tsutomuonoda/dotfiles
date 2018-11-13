;   The four Org commands ‘org-store-link’, ‘org-capture’, ‘org-agenda’,
;and ‘org-iswitchb’ should be accessible through global keys (i.e.,
;anywhere in Emacs, not just in Org buffers).  Here are suggested
;bindings for these keys, please modify the keys to your own liking.

;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-cc" 'org-capture)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)

;org-agenda でも表示されるように，org-agenda-files を設定します．
;(setq org-agenda-files
      ;; '("~/Dropbox/org/org-ical.org"
      ;; 	"~/Dropbox/org/next.org"
      ;; 	"~/Dropbox/org/work.org"
      ;; 	"~/Dropbox/org/research.org"))

;以下の例では，C-M-cを押すと，一発で「予定」専用のorgファイルが開きます．
;; (defun show-org-buffer (file)
;;     "Show an org-file on the current buffer"
;;     (interactive)
;;     (if (get-buffer file)
;;         (let ((buffer (get-buffer file)))
;;           (switch-to-buffer buffer)
;;           (message "%s" file))
;;      (find-file (concat "~/Dropbox/org/" file)))) 
;; (global-set-key (kbd "C-M-c") '(lambda () (interactive)
;;                                   (show-org-buffer "org-ical.org")))


;org-capture を使って，Emacsのどこからでも予定を追加できるようにします．
;この場合は，C-c r c と打つと新しい予定を編集するためのバッファが開かれ，
;編集後C-c C-cすれば，先ほど作成した org-ical.org に格納されます．
;; (defvar org-capture-ical-file (concat org-directory "org-ical.org"))
;;  ;; see org.pdf:p73
;;  (setq org-capture-templates
;;       `(("t" "TODO 項目を INBOX に貼り付ける" entry
;;          (file+headline nil "INBOX") "** TODO %?\n\t")
;;          ("c" "同期カレンダーにエントリー" entry
;;           (file+headline ,org-capture-ical-file "Schedule")
;;           "** TODO %?\n\t")))

;org-refile を使うと，カレンダーに表示したいタスクをどこかのバッファで見つけた時に，
;瞬時に登録できます．登録したいタスクにカーソルを置いて，
;C-c C-w して予定専用のorgファイルを選べば，当該タスクが予定専用の
;orgファイルに転送されます．
 ;; (setq org-refile-targets
 ;;       (quote (("org-ical.org" :level . 1)
 ;;               ("next.org" :level . 1)
 ;;               ("sleep.org" :level . 1))))

;次の関数を実装しておけば，C-c 1 を押すだけで ical 形式のファイルが生成されます．
;後段の転送方法と組み合わせれば，どこにでも公開できます．
;(require 'org-icalendar)
;(defun my-org-export-icalendar ()
;  (interactive)
;  (org-export-icalendar nil "~/Dropbox/org/org-ical.org"))
;(define-key org-mode-map (kbd "C-c 1") 'my-org-export-icalendar)

;;生成される ical ファイルのプロパティを設定する

;; iCal の説明文
;(setq org-icalendar-combined-description "OrgModeのスケジュール出力")
;; カレンダーに適切なタイムゾーンを設定する（google 用には nil が必要）
;(setq org-icalendar-timezone "Asia/Tokyo")
;; DONE になった TODO は出力対象から除外する
;(setq org-icalendar-include-todo t)  
;; （通常は，<>--<> で区間付き予定をつくる．非改行入力で日付がNoteに入らない）
;(setq org-icalendar-use-scheduled '(event-if-todo))
;; DL 付きで終日予定にする：締め切り日（スタンプで時間を指定しないこと）
					;(setq org-icalendar-use-deadline '(event-if-todo))

;; Enable contributed extensions to org-mode.Please see /usr/share/doc/org-mode/README.Debian
;(setq load-path (cons "/usr/share/org-mode/lisp" load-path))


;; コードブロックをハイライトする。デフォルトではEmacs Lisp(emacs-lisp)のみ。
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((latex . t)
;;    (R . t)
;;    (ruby . t)
;;    (python . t)
;;    (scheme . t)
;;    (sql . t)
;;    (ocaml . t)
;;    (org . t)
;;    (sh . t)
;;    ))


