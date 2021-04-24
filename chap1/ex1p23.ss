;;;list-index : pred X lst --> Int | #f
;;;(list-index pred lst) = return first occurence of pred true element index if exist, or #f
(define list-index
  (lambda (pred lst)
    (list-index-with-cursor pred lst 0)
    )
  )
;;;list-index-with-cursor : pred X lst X Int --> Int | #f
;;;(list-index-with-cursor pred lst cursor) = same as list-index. but cursor indicate current position in lst
(define list-index-with-cursor
  (lambda (pred lst cursor)
    (if (null? lst)
      #f
      (if (pred (car lst))
	cursor
	(list-index-with-cursor pred (cdr lst) (+ cursor 1))
	)
      )
    )
  )

(trace list-index)
(trace list-index-with-cursor)
(list-index number? `(a 2 (1 3 ) b 7))
(list-index symbol? `(a (b c ) 17 foo))
(list-index symbol? `( 1 2 (a b) 3))
(exit)
