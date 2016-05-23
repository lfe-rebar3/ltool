(defmodule ltool
  (export all))

(include-lib "clj/include/compose.lfe")

(defun main (args)
  (io:format "~s" `(,(dispatch args))))

(defun dispatch (args)
  (case args
    ('("-D") (io:format "main/1 args: ~p~nLFE args~p~n:"
                        `(,args ,(init:get_arguments))))
    ('("-h") (get-help-output))
    ('("help") (get-help-output))
    (`("help" ,task) (get-help-output task))
    (args (get-task-output args))))

(defun get-help-output ()
  (++ (usage)
      (get-output '("rebar3" "help" "lfe") '())))

(defun get-help-output (task)
  (++ (usage)
      (get-output '("rebar3" "help" "lfe") `(,task))))

(defun get-task-output (args)
  (get-output '("rebar3" "lfe") args))

(defun get-output (rebar-cmd args)
  (-> rebar-cmd
      (++ args)
      (string:join " ")
      (os:cmd)
      ;(debug-output "Cmd results: ")
      (clean-output)
      ;(debug-output "Clean results: ")
      (string:join "\n")))

; (defun debug-output (output msg)
;   (io:format "~p: ~p~n~n" `(,msg ,output))
;   output)

(defun clean-output (output)
  (-> output
      (re:split "\n" '(#(return list)))
      ;(debug-output "Tokens: ")
      (skip (to-skip))
      ;(debug-output "Not skipped: ")
      ))

(defun skip (lines regexs)
  (lists:filtermap (lambda (x) (check-line x regexs)) lines))

(defun check-line (line regexs)
  (case (lists:member 'true (get-line-matches line regexs))
    ('true 'false)
    ('false `#(true ,line))))

(defun get-line-matches (line regexs)
  (lists:map (lambda (x) (line-match? line x)) regexs))

(defun line-match? (line regex)
  (case (re:run line regex)
    (`#(match ,_) 'true)
    (_ 'false)))

(defun to-skip ()
  (lists:map #'get-compiled-regex/1 (skip-strings)))

(defun get-compiled-regex (string)
  (case (re:compile string)
    (`#(ok ,regex) regex)
    (err err)))

(defun skip-strings ()
  '(".*===> Skipping.*"
    "\s*{ref,.*"
    ".*has already been fetched.*"
    "lfe <task>:"))

(defun usage ()
  "
ltool is a tool for working with LFE projects.

Usage: ltool [help] [<task>]
")
