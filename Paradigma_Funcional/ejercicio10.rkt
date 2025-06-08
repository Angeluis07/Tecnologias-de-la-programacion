(define (largo Lista)
  (if (null? Lista)
      0
      (+ 1 (largo (cdr Lista)))))