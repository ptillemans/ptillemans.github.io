##
# Makefile for my blog
#
# @file
# @version 0.1

.PHONY: all publish publish_no_init

all: publish

publish: publish.el
	@echo "Publishing... with current Emacs configurations."
	emacs --batch --load publish.el --funcall org-publish-all

publish_no_init:
	@echo "Publishing... with --no-init"
	emacs --batch --no-init --load publish.el --funcall org-publish-all

clean:
	@echo "Cleaning up..."
	rm -rf public
	@rm -rvf *.elc
	@rm -rvf public
	@rm -rvf ~/.org-timestamps/*

serve: publish
	@echo "Serving site"
	python -m http.server --directory public

# end
