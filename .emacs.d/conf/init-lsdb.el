;;; init-lsdb.el --- LSDB Conf

;; Copyright (C) 2009  Tutomu Onoda

;; Author: Tutomu Onoda <onoben@onodalaw.com>
;; Keywords: lsdb

;;; LSDB��MU-CITE�Ȱ��˻Ȥ�
(autoload 'lsdb-mu-insinuate "lsdb")
(eval-after-load "mu-cite"
  '(lsdb-mu-insinuate))
