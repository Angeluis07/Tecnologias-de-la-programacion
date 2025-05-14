#lang racket
displayln (cdr(cdr(cdr'( a b c . x))))

displayln (car(cdr(cdr(cdr'( a b c x)))))