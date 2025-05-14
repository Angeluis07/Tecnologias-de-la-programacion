#lang racket
(define (resta a b)
  (- a b))

; Usamos la función resta
(define resultado (resta 5 7))

; Mostramos el resultado en la consola
(displayln (string-append "El resultado de la resta es: " (number->string resultado)))