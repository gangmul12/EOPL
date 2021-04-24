;;;sort/predicate : pred X loi --> loi
;;;(sort/predicate pred loi) = return sorted loi in (pred) order

;;;merge : loi X loi --> loi
;;;(merge loi1 loi2) = return sorted merged list with sorted lois
;;;merge-with-result : loi X loi x loi --> loi
;;;(merge-with-result loi1 loi2 result) = return sorted merged list with sorted lois into result loi


(define merge-with-result
  (lambda (pred loi1 loi2 result)
    (cond
      [(null? loi1) (list result loi2)]
      [(null? loi2) (list result loi1)]
      [(pred (car loi1) (car loi2)) (merge-with-result pred (cdr loi1) loi2 (list result (car loi1)))]
      [else (merge-with-result pred loi1 (cdr loi2) (list result (car loi2)))]
      )
    )
  )

(define merge
  (lambda (pred loi1 loi2)
    (flatten (merge-with-result pred loi1 loi2 `()))
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



;;;sort : loi --> loi
;;;(sort loi) = return sorted loi in ascending order
;;;sort-with-merged-list : loi X loi --> loi
;;;(sort-with-merged-list merged-list loi) = merge loi into merged-list in ascending order
(define sort/predicate
  (lambda (pred loi)
    (sort-with-merged-list pred `() loi)
    )
  )
(define sort-with-merged-list
  (lambda (pred merged-list loi)
    (if (null? loi)
      merged-list
      (sort-with-merged-list pred (merge pred merged-list (list (car loi))) (cdr loi))
      )
    )
  )

(sort/predicate < `(8 2 5 2 3))
(sort/predicate > `(8 2 5 2 3))
(exit)
