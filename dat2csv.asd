(in-package :asdf-user)

(defsystem "dat2csv"
  :author "Jin-Ho King <j@kingesq.us>"
  :version "0.1.0"
  :license "MIT"
  :description "convert Concordance DAT file to CSV"
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")

  ;; Dependencies.
  :depends-on (:clingon :cl-csv :auto-text :flexi-streams)

  ;; Project stucture.
  :serial t
  :components ((:module "src"
                        :serial t
                        :components ((:file "packages")
                                     (:file "dat2csv"))))

  ;; Build a binary:
  ;; don't change this line.
  :build-operation "program-op"
  ;; binary name: adapt.
  :build-pathname "dat2csv"
  ;; entry point: here "main" is an exported symbol. Otherwise, use a double ::
  :entry-point "dat2csv:main")
