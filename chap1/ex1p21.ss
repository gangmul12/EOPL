;;;product : listof(sym) X listof(sym) --> listof(pair(symbol))
;;;(product sos1 sos2) = list of pair which first elem is in sos1 and second elem is in sos2.
(define product
  (lambda (sos1 sos2)
    (if (null? sos1)
      `()
      (append (one-product (car sos1) sos2) (product (cdr sos1) sos2))
      )
    )
  )
;;;one-product : sym x listof(sym) --> listof(symbolPair)
;;;(one-product sym sos) = list of pair which first elem is sym and second elem is in sos
(define one-product
  (lambda (sym sos)
    (if (null? sos)
      `()
      (cons (list sym (car sos)) (one-product sym (cdr sos)))
      )
    )
  )

(trace product)
(trace one-product)
(product `(a b) `(x y z))
(product `(a b c) `(x y))
(exit)    

