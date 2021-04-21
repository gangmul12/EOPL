;;; invert : listof(2-list) --> listof(2-list)
;;; (invert lst) = list of 2-list that each element is invert of original element.
;;; 2-list := {tuple}*
(define invert
  (lambda (lst)
    (if (null? lst)
      `()
      (cons (list (cadar lst) (caar lst)) (invert (cdr lst)))
      )
    )
  )
(trace invert)
(invert `((a 1) (a 2) (1 b) (2 b)))
(exit)
