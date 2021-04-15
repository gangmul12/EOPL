;;; remove-first: los X sym --> lst
;;; (remove-first sym los) = los without first sym in los. return original los if los does not have sym
(define remove-first-recurse
  (lambda (sym los)
    (if (null? los)
      `()
      (if (eq? (car los) sym)
	(cdr los)
	(cons (car los) (remove-first-recurse sym (cdr los)))
	)
      )
    )
  )
(define remove-first
  (lambda (sym los)
    (remove-first-recurse sym los)
    )
  )

(trace remove-first)
(remove-first `a `(a b c))
(remove-first `b `(a b c))
(exit)
