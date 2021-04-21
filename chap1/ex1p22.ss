;;;filter-in : pred X list --> list
;;;(filter-in pred lst) = list of element which is in lst that pass pred 
(define filter-in
  (lambda (pred lst)
    (if (null? lst)
      `()
       (pred-return pred (car lst) (filter-in pred (cdr lst))) 
      )
    )
  )
;;; pred-return : pred X elem --> elem
;;; (pred-return pred elem) = pred? elem ? elem : `()
(define pred-return
  (lambda(pred elem filtered)
    (if (pred elem)
      (cons elem filtered)
      filtered
      )
    )
  )
(trace filter-in)
(trace pred-return)
(filter-in number? `(a 2 (1 3) b 7))
(filter-in symbol? `(a (b c) 17 foo))
(exit)
