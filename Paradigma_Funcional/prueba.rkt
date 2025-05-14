; filepath: c:\Users\angel\Desktop\Tecnologias_de_la_programacion\Practica\Paradigma_Funcional\prueba.rkt
#lang racket

; Definimos una función que suma dos números
(define (suma a b)
  (+ a b))

(define (suma-lista lista)
  (if (null? lista)
      0
      (+ (car lista) (suma-lista (cdr lista)))))



; Usamos la función suma
(define resultado (suma 5 7))

; Mostramos el resultado en la consola
(displayln (string-append "El resultado de la suma es: " (number->string resultado)))

(displayln (string-append "El resultado de la suma de la lista es: " (number->string (suma-lista '(1 2 3 4 5)))))