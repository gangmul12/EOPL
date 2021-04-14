;list-length : List -> int
; usage: (list-length l) = the length of list l
(define list-length
  (lambda (lst)
    (if (null? lst)
      0
      (+ 1 (list-length (cdr lst)) ))))
(trace list-length)
(list-length `(a b c))
(exit)
