;;;subst: sym x sym x slist --> slist
;;;(subst new old slist) --> slist that old in slist is substitue with new
;;; s-list :: = () | (s-exp . s-list)
;;; s-exp :: symbol | s-list
(define subst
  (lambda (new old slist)
    (if (eqv? slist `())
      `()
      (cons (subst-in-s-exp new old (car slist)) (subst new old (cdr slist))))))
(define subst-in-s-exp
  (lambda (new old sexp)
    (if (symbol? sexp)
      (if (eqv? sexp old)
	new
	sexp
	)
      (subst new old sexp)
      )
    )
  )

(define subst-inline
  (lambda (new old slist)
    (if (eqv? slist `())
      `()
      (cons 
	(if (symbol? (car slist))
	  (if(eqv? (car slist) old)
	    new
	    (car slist)
	    )
	  (subst-inline new old (car slist))
	  )
	(subst-inline new old (cdr slist))))))
(define value-list
  (lambda (sym len)
    (if(eqv? len 0)
	`()
	(cons sym (value-list sym (- len 1)))
	)
    )
  )
(define subst-map-in-s-exp
  (lambda (new old sexp)
    (if (symbol? sexp)
      (if (eqv? sexp old)
	new
	sexp
	)
      (subst-map new old sexp)
      )
    )
  )

(define subst-map
  (lambda (new old slist)
    (map (lambda (l) (subst-in-s-exp new old l)) slist)
    )
  )
(trace subst)
(trace subst-in-s-exp)
(trace subst-inline)
(trace subst-map)
(trace subst-map-in-s-exp)

(subst `a `b `((b c) (b () d)))
(subst-inline `a `b `((b c) (b () d)))
(subst-map `a `b `((b c) (b () d)))

(exit)
    
