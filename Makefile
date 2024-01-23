LISP ?= sbcl

all: test

run:
	rlwrap $(LISP) --load run.lisp

build:
	$(LISP)	--non-interactive \
		--load dat2csv.asd \
		--eval '(ql:quickload :dat2csv)' \
		--eval '(asdf:make :dat2csv)'

test:
	$(LISP) --non-interactive \
		--load run-tests.lisp
