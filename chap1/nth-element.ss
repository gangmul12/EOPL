;;;nth-element : List X int --> element
;;;Usage : (nth-element lst i) = return ith element of lst
(define nth-element
  (lambda (lst i)
    (if (null? lst)
      (report-list-too-short i)
      (if (zero? i)
	(car lst)
	(nth-element (cdr lst) (- i 1))
	))))
(define report-list-too-short
  (lambda (i)
    (errorf `nth-element
		"list too short by ~s element.~%" (+ i 1)
		)))
    
(trace nth-element)
(nth-element `(a b c) 1)
