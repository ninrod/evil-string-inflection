emacs ?= emacs
bemacs = $(emacs) -batch -l test/elpa.el
LIBS = -l test/elpa.el -l evil.el -l goto-chg.el -l string-inflection.el -l undo-tree.el -L . -l evil-string-inflection.el -L test -l test.el

update:
	$(emacs) -batch -l test/make-update.el

emacs:
	$(emacs) -Q $(LIBS) \
	--eval "(evil-mode 1)"

compile: clean
	$(bemacs) -l test/make-compile.el

test:
	$(bemacs) -l test/make-test.el

clean:
	rm -f *.elc

.PHONY: update compile test clean
