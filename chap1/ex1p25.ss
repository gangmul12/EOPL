;;; exist? : pred X lst --> Boolean
;;; (exist? pred lst)  = if pred satisfy for some element in lst, return true else false
(define exists?
  (lambda (pred lst)
    ( if(null? lst)
	#f
	(or (pred (car lst)) (exists? pred (cdr lst)))
	)
    )
  )
(trace exists?)
(exists? number? `(a b c 3 e))
(exists? number? `(a b c d e))
(exit)

