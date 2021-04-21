;;;list-set: list X n X x --> list
;;;(list-set lst n x) = lst but nth element is x
(define list-set
  (lambda (lst n x)
    (if (eqv? n 0)
	(cons x (cdr lst))
	(cons (car lst) (list-set (cdr lst) (- n 1) x))
	)
    )
  )

(trace list-set)
(list-set `(a b c d) 2 `(1 2))
(list-set `(a b c d) 3 `(1 5 10))
(list-ref (list-set `(a b c d) 3 `(1 5 10)) 3)
