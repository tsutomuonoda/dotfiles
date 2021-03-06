;;; init-keymap.el --- keymap Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lisp

;; Deleteキーでカーソル位置の文字が消えるようにする
(global-set-key [delete] 'delete-char)

;; C-h キーでカーソルの左の文字が消えるようにする。
;; ただし、もともと C-h はヘルプなので、
;; これを有効にすると、ヘルプを使うときには
;; M-x help や F1 を使う必要があります。
;(global-set-key "\C-h" 'delete-char)


;こちらを使う
;keyboard-translate を使用して C-h に backspace と同じ処理を割り当てる
(keyboard-translate ?\C-h ?\C-?)

;; バッファメニューへの自動移動
;(global-set-key "\C-x\C-b" 'electric-buffer-list)
;(global-set-key "\C-x\C-b" 'ibuffer)

;; 次のウィンドウに移動する
(global-set-key "\C-c\C-n" 'other-window)

;; 前のウィンドウに移動する
(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key "\C-c\C-p" 'other-window-backward)

;;1回に1行のスクロール
(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-line-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-n-line-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

(global-set-key "\C-c\C-z" 'scroll-n-line-ahead)
(global-set-key "\C-c\C-q" 'scroll-n-line-behind)

;; カーソルをウィンドウの左上隅にジャンプさせる
(defun point-to-top ()
  "Put point on top line of windw."
  (interactive)
  (move-to-window-line 0))

(global-set-key "\C-c," 'point-to-top)

;; ;; カーソルをウィンドウの左下隅にジャンプさせる
(defun point-to-bottom ()
  "Put point at beginning of last visible."
  (interactive)
  (move-to-window-line -1))

(global-set-key "\C-c." 'point-to-bottom)

;; ;; カーソルのある行をウィンドウの最初の行にする
(defun line-to-top ()
  "Move current line to top of window."
  (interactive)
  (recenter 0))

(global-set-key "\C-c!" 'line-to-top)

;; ;;シンボリックリンクの編集に警告を発する
(defun read-only-if-symlink ()
  (if (file-symlink-p buffer-file-name)
      (progn
	(setq buffer-read-only t)
	(message "File is a symlink"))))

  (add-hook 'find-file-hooks 'read-only-if-symlink)

;; ;;シンボリックリンクの先をバッファに読み込む
(defun visit-target-instead ()
  "Replace this buffer with a buffer visiting the link target."
  (interactive)
  (if buffer-file-name
      (let ((target (file-symlink-p buffer-file-name)))
	(if target
	    (find-alternate-file target)
	  (error "Not visiting a smlink")))
    (error "Not visiting a file")))

(global-set-key "\C-c\C-t" 'visit-target-instead)

;;シンボリックリンクを上書きしてから読み込む
(defun clobber-symlink ()
  "Replace symlink with a copy of the file."
  (interactive)
  (if buffer-file-name
      (let ((target (file-symlink-p buffer-file-name)))
	(if target
	    (if (yes-or-no-p (format "Replace %s with $s? "
				     buffer-file-name
				     target))
		(progn
		  (delete-file buffer-file-name)
		  (write-file buffer-file-name)))
	  (error "Not visiting a smlink")))
    (error "Not visiting a file")))

(global-set-key "\C-c\C-l" 'clobber-symlink)

;;バッファの切り換えにアドバイスを与える
(defadvice switch-to-buffer (before existing-buffer
				    activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
		      (other-buffer)
		      (null current-prefix-arg)))))

(defadvice switch-to-buffer-other-window (before existing-buffer
						 activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
		      (other-buffer)
		      (null current-prefix-arg)))))

(defadvice switch-to-buffer-other-frame (before existing-buffer
						activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
		      (other-buffer)
		      (null current-prefix-arg)))))

;; helm用keymap
(global-set-key (kbd "C-c h") 'helm-mini)
