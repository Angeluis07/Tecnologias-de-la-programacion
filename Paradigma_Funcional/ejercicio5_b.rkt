#lang racket
;5) Reescriba las siguientes expresiones, usando Let para remover
; las subexpresiones comunes y para
; mejorar la estructura del código. No realice ninguna simplificación algebraica:

;(cons (car (list a b c)) (cdr (list a b c)))
(define a 5)
(define b 6)
(define c 7)
(let ([y (list a b c)])
    (cons (car y) (cdr y))
    )