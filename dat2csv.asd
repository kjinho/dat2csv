(in-package :asdf-user)

(defsystem "dat2csv"
  :author "Jin-Ho King <j@kingesq.us>"
  :version "0.1.1"
  :license "MIT"
  :description "convert Concordance DAT file to CSV"
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")

  :class :package-inferred-system

  ;; Dependencies.
  :depends-on ("dat2csv/src/main")

  ;; Build a binary:
  ;; don't change this line.
  :build-operation "program-op"
  ;; binary name: adapt.
  :build-pathname "dat2csv"
  ;; entry point: here "main" is an exported symbol. Otherwise, use a double ::
  :entry-point "dat2csv/src/main:main")
