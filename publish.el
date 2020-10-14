;;; publish.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Peter Tillemans
;;
;; Author: Peter Tillemans <http://github/PeterTillemans>
;; Maintainer: Peter Tillemans <pti@snamellit.com>
;; Created: October 14, 2020
;; Modified: October 14, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/PeterTillemans/publish
;; Package-Requires: ((emacs 26.3) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(require 'ox-publish)


(setq org-publish-project-alist
      '(("posts"
         :base-directory "posts/"
         :base-extension "org"
         :publishing-directory "public/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :auto-sitemap t)
        ("css"
         :base-directory "css/"
         :base-extension "css"
         :publishing-directory "public/css"
         :publishing-function org-publish-attachment
         :recursive t)
        ("all" :components ("posts"))))


;;; publish.el ends here
