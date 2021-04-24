;;;every? : pred X lst --> Boolean
;;;(every? pred lst) = check if every element in lst satisfy pred
(define every?
  (lambda (pred lst)
    (if (null? lst)
      #t
      (and (pred (car lst)) (every? pred (cdr lst)))

      )
    )
  )
(trace every?)
(every? number? `(a b c 3 e))
(every? number? `(1 2 3 4 5))
(exit)
