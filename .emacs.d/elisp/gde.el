;;; gde.el --- Integrated Development Environment for Gauche.

;; Copyright (C) 2008  Tutomu Onoda.

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: gauche, tools

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This is one of a set of packages that make up the 
;; Gauche Development Environment (GDE) for Emacs. See the
;; GDE User's Guide for more information.

;; The latest version of the GDE is available at
;; <URL:http://gdee.sorceforge.jp>.

;; Please send any comments, bugs, or upgrade requests to
;; Tsutomu Onoda at onoben@onodalaw.com.

;; ToDo
;;キーマップの継承
;関数に色づけできるようにしい。
;動的略語展開をしたい。

;;; Code:

;; Dependencies:

(require 'cmuscheme)
(require 'scheme)

(defun gde-mode ()
  "Major mode for developing Gauche applications and applets."
  (interactive)
  (setq major-mode 'gde-mode)
  (setq mode-name "GDE")
;  (setq gde-mode-keymap (make-keymap))

;;   (let ((gde-mode-keymap (make-sparse-keymap)))
;;     (set-keymap-parent gde-mode-keymap scheme-mode-map)
;;     gde-mode-keymap)

;;  gde-mode-keymap



;(let ((gde-mode-keymap ()))
;  (set-keymap-parent map scheme-mode-map)
;  map)


;;   (define-key my-local-map "h" 'backward-char)
;;   (define-key my-local-map "j" 'next-line)
;;   (define-key my-local-map "k" 'previous-line)
;;   (define-key my-local-map "l" 'forward-char)
;;   (define-key my-local-map "\C-ch" 'hello-world)
;  (use-local-map gde-mode-keymap)
)

(defun hello-world ()
  (interactive)
  (insert "Hello,world!\n"))

(provide 'gde-mode)

;;; gde.el ends here



