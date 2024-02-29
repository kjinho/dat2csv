LISP ?= sbcl
QLOT ?= qlot

all: build

run:
	rlwrap $(QLOT) exec $(LISP) --load run.lisp

build:
	$(QLOT) exec \
                $(LISP) --non-interactive \
		--load dat2csv.asd \
		--eval '(ql:quickload :dat2csv)' \
		--eval '(asdf:make :dat2csv)'

test:
	$(LISP) --non-interactive \
		--load run-tests.lisp

clean:
	rm dat2csv
