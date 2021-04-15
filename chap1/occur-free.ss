;;; occur-free? : var X exp --> bool
;;; (occur-free? var exp) = whether var is occur-free in exp
(define occur-free?
  (lambda (var e)
    (if (not (pair? e))
      (if (eqv? e var)
	#t
	#f
	)
      (if (eqv? (car e) `lambda)
	(and (not (eqv? (car (car (cdr e))) var)) (occur-free? var (cdr (cdr e))))
	(or (occur-free? var (car e)) (occur-free? var (cdr e)))
	)
      )
    )
  )

(define occur-free-cond?
  (lambda (var e)
    (cond
      [(not (pair? e)) (if (eqv? e var) #t #f)]
      [(eqv? (car e) `lambda) (and (not (eqv? (car (car (cdr e))) var)) (occur-free-cond? var (cdr (cdr e))))]
      [else (or (occur-free-cond? var (car e)) (occur-free-cond? var (cdr e)))]
      )
    )
  )
(trace occur-free?)
(trace occur-free-cond?)

(occur-free? `x `x)
(occur-free? `x `y)
(occur-free? `x `(lambda (x) (x y)))
(occur-free? `x `(lambda (y) (x y)))
(occur-free? `x `((lambda (x) x) (x y)))
(occur-free? `x `(lambda (y) (lambda (z) (x (y z)))))
(occur-free-cond? `x `x)
(occur-free-cond? `x `y)
(occur-free-cond? `x `(lambda (x) (x y)))
(occur-free-cond? `x `(lambda (y) (x y)))
(occur-free-cond? `x `((lambda (x) x) (x y)))
(occur-free-cond? `x `(lambda (y) (lambda (z) (x (y z)))))

(exit)

