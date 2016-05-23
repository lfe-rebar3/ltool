(defmodule ltool
  (export all))

(defun main (args)
  (io:format "main/1 args: ~p~nLFE args~p~n:" `(,args ,(init:get_arguments))))
