#lang racket

(let ([x 9])
    (* x
        (let ([x (/ x 3)])
            (+ x x))))

;(let ([x 9])
;    (* 9
;        (let ([x (/ 9 3)])
;            (+ 3 3))))
;9*6=54