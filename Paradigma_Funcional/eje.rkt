#lang racket

(let ([x 10])
    (let ([x 20])
        (displayln (+ x 5)))
    x)
(let ([X (* 2 3)]
       [Y (* 4 2)]
       [z (+ X Y)])
  z)

(define (mi-funcion a)
  a)

(define (mi-funcion a b)
  (+ a b))