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


(setq website-html-head "<link rel=\"stylesheet\" href=\"css/site.css\"
  type=\"text/css\"/>")

(setq website-html-preamble
      "<div class=\"nav\">
<ul>
<li><a href=\"/\">Home</a></li>
<li><a href=\"/static/about.html\">About</a></li>
<li><a href=\"https://github.com/ptillemans\">GitHub</a></li>
<li><a href=\"/index.xml\">RSS</a></li>
</ul>
</div>")

(setq website-html-postamble "<div class=\"footer\"> Copyright 2020 %a (%v
  HTML).<br> Last updated %C.<br> Built with %c.  </div>")

(setq org-publish-project-alist
      `(("posts"
         :base-directory "blog/posts/"
         :base-extension "org"
         :publishing-directory "public/"
         :recursive t
         :publishing-function org-html-publish-to-html

         :auto-sitemap t
         :sitemap-title "Blog Index"
         :sitemap-filename "index.org"
         :sitemap-style tree
         :sitemap-file-entry-format "%d - %t"
         :sitemap-sort-files anti-chronologically

         :html-doctype "html5"
         :html-html5-fancy t
         :html-head ,website-html-head
         :html-head-extra
         "<link rel=\"alternate\" type=\"application/rss+xml\"
                href=\"https://rkallos.com/posts.xml\"
                title=\"RSS feed\">"
         :html-preamble ,website-html-preamble
         :html-postamble ,website-html-postamble

         :author "Peter Tillemans"
         :email "pti@snamellit.com"
         :with-creator t)
        ("blog-static"
         :base-directory "blog/posts/"
         :base-extension "png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "public_html/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("css"
         :base-directory "blog/css/"
         :base-extension "css"
         :publishing-directory "public/css"
         :publishing-function org-publish-attachment
         :recursive t)
        ("all" :components ("posts" "css" "blog-static"))))


;;; publish.el ends here
