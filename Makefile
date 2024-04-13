LISP ?= sbcl

all: build

run:
	$(LISP) --no-userinit --load .qlot/setup.lisp \
		--load run.lisp

build:
	$(LISP) --no-userinit --non-interactive \
        --load .qlot/setup.lisp \
		--load dat2csv.asd \
		--eval '(ql:quickload :dat2csv)' \
		--eval '(asdf:make :dat2csv)'

test:
	$(LISP) --non-interactive \
		--load run-tests.lisp

clean:
	rm dat2csv
