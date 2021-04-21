;;;down: lst --> lst
;;;(down lst) = wraps paran around each top level elem

(define down
  (lambda (lst)
    (if (null? lst)
      `()
      (cons (list (car lst)) (down (cdr lst)))
      )
    )
  )
(trace down)
(down `(1 2 3))
(down `((a) (fine) (idea)))
(down `(a (more (complicated)) object) )
(exit)
    
