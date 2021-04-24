;;;flatten : slist --> listof symbol
;;;(flatten lst ) = return wihtout inner paran
(define flatten
  (lambda(lst)
    (flatten-with-result lst `())
    )
  )
(define flatten-with-result
  (lambda (lst result)
    (if (null? lst)
      result
      (if (symbol? lst)
	(cons lst result)
	(flatten-with-result (car lst) (flatten-with-result (cdr lst) result))
	)
      )
    )
  )

(trace flatten-with-result)
(flatten `(a b c))
(flatten `((a) () (b ()) () (c)))
(flatten `((a b) c (((d)) e)))
(flatten `(a b (()(c))))
(exit)

