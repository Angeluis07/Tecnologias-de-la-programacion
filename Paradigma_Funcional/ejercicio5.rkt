#lang racket
;5) Reescriba las siguientes expresiones, usando Let para remover las subexpresiones comunes y para
; mejorar la estructura del código. No realice ninguna simplificación algebraica:

;(+ (/ (* 7 a) b) (/ (* 3 a) b) (/ (* 7 a) b))

; (7*a / b) + (3*a / b) + (7*a / b)
(define a 5)
(define b 5)

(let ([y (/ (* 7 a) b)] [z (/ (* 3 a) b)])
    (+ y z y)
    )

(let ([x (* 7 a)]
      [y (* 3 a)])
  (+ (/ x b) (/ y b) (/ x b)))

