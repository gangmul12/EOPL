;;;nth-element : List X int --> element
;;;Usage : (nth-element lst i) = return ith element of lst
(define nth-element-recurse
  (lambda (lst-original i-original lst i)
    (if (null? lst)
      (report-list-too-short lst-original i-original)
      (if (zero? i)
	(car lst)
	(nth-element-recurse lst-original i-original (cdr lst) (- i 1))
	)

      )
    )
  )
(define nth-element
  (lambda (lst i)
    (nth-element-recurse lst i lst i)
    )
  )
    
(define report-list-too-short
  (lambda (lst i)
    (errorf `nth-element
		"`~s does not have ~s elements.~%" lst (+ i 1)
		)))
    
(trace nth-element)
(nth-element `(a b c) 1)
(nth-element `(a b c d e) 8)
(exit)
