(uiop:define-package :dat2csv/src/main
  (:use :cl)
  (:import-from :clingon)
  (:import-from :cl-csv)
  (:import-from :auto-text)
  (:import-from :flexi-streams)
  (:export :main
           :convert-concordance-to-csv))
(in-package :dat2csv/src/main)

(defparameter *separator* #\)
(defparameter *quote* #\þ)

(defun convert-concordance-to-csv (filename &key (stream *standard-output*))
  (let ((file-info (auto-text:analyze filename 
                                      :silent t
                                      :sample-size 0)))
    (cl-csv:write-csv 
     (with-open-file (s filename :element-type '(unsigned-byte 8))
       (setq s (flexi-streams:make-flexi-stream
                s
                :external-format (case (getf file-info :bom-type)
                                   (:utf-16le :utf-16le)
                                   (otherwise :utf-8))))
       (cl-csv:read-csv s 
                        :separator *separator*
                        :quote *quote*))
     :stream stream)))

(defun cli/options ()
  "Returns a list of options for our main command"
  (list
   (clingon:make-option
    :flag
    :description "help"
    :short-name #\h
    :key :help)   
   ))

(defun cli/handler (cmd)
  "The top-level handler"
  (let ((args      (clingon:command-arguments cmd))
        (help      (clingon:getopt cmd :help)))
    (cond ((or (null args) help)
           (clingon:print-usage cmd t))
          (t
           (when (not (probe-file (first args)))
             (error "ERROR: File `~a` does not exist." (first args)))
           (convert-concordance-to-csv (first args))))))


(defun cli/command ()
  (clingon:make-command
   :name "dat2csv"
   :description "convert Concordance DAT file to CSV"
   :version "0.1.0"
   :license "All rights reserved"
   :authors '("Jin-Ho King <j@kingesq.us>")
   :usage "[OPTIONS] <DAT-FILE>"
   :options (cli/options)
   :handler #'cli/handler))


(defun %main (&rest argv)
  (setf clingon:*default-help-flag*
    (clingon:make-option 
     :flag
     :description "display usage information and exit"
     :long-name "help"
     :short-name #\h
     :key :clingon.help.flag))
  (let ((app (cli/command)))
    (clingon:run app argv)))
        
(defun main ()
  "Entry point for the executable.
  Reads command line arguments."
  ;; uiop:command-line-arguments returns a list of arguments (sans the script name).
  ;; We defer the work of parsing to %main because we call it also from the Roswell script.
  (apply #'%main (uiop:command-line-arguments)))
