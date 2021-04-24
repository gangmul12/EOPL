;;;merge : loi X loi --> loi
;;;(merge loi1 loi2) = return sorted merged list with sorted lois
;;;merge-with-result : loi X loi x loi --> loi
;;;(merge-with-result loi1 loi2 result) = return sorted merged list with sorted lois into result loi

(define merge-with-result
  (lambda (loi1 loi2 result)
    (cond
      [(null? loi1) (list result loi2)]
      [(null? loi2) (list result loi1)]
      [(< (car loi1) (car loi2)) (merge-with-result (cdr loi1) loi2 (list result (car loi1)))]
      [(>= (car loi1) (car loi2)) (merge-with-result loi1 (cdr loi2) (list result (car loi2)))]
      )
    )
  )
(define merge
  (lambda (loi1 loi2)
    (flatten (merge-with-result loi1 loi2 `()))
    )
  )
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
      (if (not (list? lst))
	(cons lst result)
	(flatten-with-result (car lst) (flatten-with-result (cdr lst) result))
	)
      )
    )
  )

(trace merge-with-result)
(trace flatten-with-result)
(merge `(1 4) `(1 2 8))
(merge `(35 62 81 90 91) `(3 83 85 90))
(exit)
