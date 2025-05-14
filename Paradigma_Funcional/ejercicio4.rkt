#lang racket
;Obtenga el elemento x de las siguientes listas:
;( a b c . x)
;(a b c x)
;((a . x) b)
;(x . a)
;(a . x)

displayln (cdr(cdr(cdr'( a b c . x))))

displayln (car(cdr(cdr(cdr'( a b c x)))))

displayln (cdr(car '((a . x) b)))

displayln (car '(x . a))

displayln (cdr '(a . x))