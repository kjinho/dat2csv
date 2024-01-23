(in-package :asdf-user)
(defsystem "dat2csv-tests"
  :description "Test suite for the dat2csv system"
  :author "Jin-Ho King <j@kingesq.us>"
  :version "0.0.1"
  :depends-on (:dat2csv
               :fiveam)
  :license "BSD"
  :serial t
  :components ((:module "tests"
                        :serial t
                        :components ((:file "packages")
                                     (:file "test-dat2csv"))))

  ;; The following would not return the right exit code on error, but still 0.
  ;; :perform (test-op (op _) (symbol-call :fiveam :run-all-tests))
  )
