;;;duple : int X sym --> list
;;;(duple i sym) = list of sym, with length i
(define duple
  (lambda (i sym)
    (if (eqv? i 0)
      `()
      (if (eqv? i 1)
	(list sym)
      	(cons sym (duple (- i 1) sym))
      	)
      )
    )
  )

(trace duple)

(duple 2 3)
(duple 4 `(ha ha))
(duple 0 `(blah))
(exit)

