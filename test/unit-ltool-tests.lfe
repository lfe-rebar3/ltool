(defmodule unit-ltool-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest to-skip
  (is-equal '(re_pattern re_pattern re_pattern re_pattern)
            (lists:map (lambda (x) (element 1 x)) (ltool:to-skip))))

(deftest line-match?
  (is-equal 'true
            (ltool:line-match?
              "===> Skipping lfe (from {git,\"git://github.com/rvirding/lfe.git\,"
              (lists:nth 1 (ltool:to-skip))))
  (is-equal 'true
            (ltool:line-match?
              "                                   {ref,"
              (lists:nth 2 (ltool:to-skip))))
  (is-equal 'true
            (ltool:line-match?
              "the same name has already been fetched"
              (lists:nth 3 (ltool:to-skip))))
  (is-equal 'false
            (ltool:line-match?
              "this is a good line"
              (lists:nth 3 (ltool:to-skip)))))

(deftest skip
  (let ((lines '("===> Skipping lfe (from {git,\"git://github.com/rvirding/lfe.git\,"
                 "                                   {ref,"
                 "the same name has already been fetched"
                 "this is a good line"
                 "another good one")))
    (is-equal '("this is a good line" "another good one")
              (ltool:skip lines (ltool:to-skip))))
  (let ((lines '("this is a good line"
                 "another good one")))
    (is-equal '("this is a good line" "another good one")
              (ltool:skip lines (ltool:to-skip))))
  (let ((lines '("===> Skipping lfe (from {git,\"git://github.com/rvirding/lfe.git\,"
                 "                                   {ref,"
                 "the same name has already been fetched")))
    (is-equal '()
              (ltool:skip lines (ltool:to-skip)))))
