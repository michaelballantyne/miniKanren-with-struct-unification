#lang racket

(require "mk/mk.rkt")

(include "mk/test-check.scm")

(struct s (a) #:transparent)

(test "simple structural"
  (run 1 (q)
       (== (s 'a) (s q)))
  '(a))

(test "case-for-absento"
  (run 1 (q)
       (== q (s 'a)))
  (list (s 'a)))

(test "absento-1"
  (run 1 (q)
       (== q (s 'a))
       (absento 'a q))
  '())

(test "absento-weird"
  (run 1 (q)
       (== q (s 'a))
       (absento 'struct:s q))
  '())
