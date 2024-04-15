LISP ?= sbcl

SBCL_ARGS =
SBCL_BUILD_ARGS =
ifeq ($(LISP),sbcl)
	SBCL_ARGS = --no-userinit
	SBCL_BUILD_ARGS = --non-interactive
endif

LISP_ARGS ?= $(SBCL_ARGS)
LISP_BUILD_ARGS = $(SBCL_BUILD_ARGS)

all: build

run:
	$(LISP) \
		$(LISP_ARGS) \
		--load .qlot/setup.lisp \
		--load run.lisp

build:
	$(LISP) \
		$(LISP_ARGS) \
		$(LISP_BUILD_ARGS) \
        --load .qlot/setup.lisp \
		--load dat2csv.asd \
		--eval '(ql:quickload :dat2csv)' \
		--eval '(asdf:make :dat2csv)'

test:
	$(LISP) \
		$(LISP_ARGS) \
		$(LISP_BUILD_ARGS) \
		--load run-tests.lisp

clean:
	rm dat2csv
