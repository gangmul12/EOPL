;;;up : lst-->lst
;;;(up lst) == lst without top level element paran
(define up
  (lambda (lst)
    (if(null? lst)
      `()
      (if (list? (car lst))
	(concat (car lst) (up (cdr lst)))
	(cons (car lst) (up (cdr lst)))
	)
      )
    )
  )
;;;concat : lst X lst -> lst
;;;(concat lst1 lst2) = concat two list without paran
(define concat
  (lambda(lst1 lst2)
    (if (null? (cdr lst1))
      (cons (car lst1) lst2)
      (cons (car lst1) (concat (cdr lst1) lst2))
      )
    )
  )
(trace up)
(trace concat)
(up `((1 2) (3 4)))
(up `((x (y)) z) )
(exit)
