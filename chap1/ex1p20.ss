;;;count-occurences:  sym X slist -> Int
;;;(count-occurences sym slist) = number of occurence of symbol in slist
(define count-occurences
  (lambda (sym slist)
    (cond
      [(null? slist) 0]
      [(symbol? slist)(if(eqv? slist sym) 1 0)]
      [else (+ (count-occurences sym (car slist)) (count-occurences sym (cdr slist)))]
      )
    )
  )
(trace count-occurences)
(count-occurences `x `((f x) y (((x z) x))))
(count-occurences `x `((f x) y (((x z) () x))))
(count-occurences `w `((f x) y (((x z) x))))
(exit)
