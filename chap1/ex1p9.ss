;;;remove-all: los X s -> los
;;;(remove-all s los) = los wihtout s
(define remove-all
  (lambda (s los)
    (if (null? los)
      `()
      (if (eq? s (car los))
	(remove-all s (cdr los))
	(cons (car los) (remove-all s (cdr los)))
	)
      )
    )
  )
(trace remove-all)
(remove-all `b `(a b c b b c d))
(remove-all `b `(a c a c a c a))
(exit)
