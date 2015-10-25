(defmodule ltool-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'ltool))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(ltool ,(get-version)))))
