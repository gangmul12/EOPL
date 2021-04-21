;;; swapper: sym X sym X slist --> slist
;;; (swapper s1 s2 slist) = slist but s1 <= s2 and s2 <= s1
(define swapper
  (lambda(s1 s2 lst)
    (if (null? lst)
      `()
      (if (symbol? lst)
        (if(eqv? s1 lst)
  	  s2
  	  (if(eqv? s2 lst)
	    s1
	    lst
	    )
	  )
        (cons (swapper s1 s2 (car lst)) (swapper s1 s2 (cdr lst)))
        )
      )
    )
  )

(trace swapper)
(swapper `a `d `(a b c d))
(swapper  `a `d `(a d () c d))
(swapper `x `y `((x) y (z (x))))
(exit)
