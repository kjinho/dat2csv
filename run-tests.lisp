
(load "dat2csv.asd")
(load "dat2csv-tests.asd")

(ql:quickload "dat2csv-tests")

(in-package :dat2csv-tests)

(uiop:quit (if (run-all-tests) 0 1))
