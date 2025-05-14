;1) sumar los números de una lista
#lang racket

(define sumaLista
 (lambda (ls)
  (if (null? ls)
    0
    (+ (car ls) (sumaLista (cdr ls))))))

;2) Calcular el peso de una palabra

(define pesoPalabra
 (lambda (palabra)
    (sumaLista (map char->integer (string->list palabra)))))

;3) Concatenar cada palabra con su peso

(define listaPesos
 (lambda (ls)
  (map cons ls (map pesoPalabra ls)))) ;map cons ("moto" "auto" "casa") (447 441 408)

;4) Insertar elementos de forma ordenada

(define insertaOrdenado
 (lambda (e ls)
  (if (null? ls)
   (list e)
   (if (< (cdr e) (cdar ls))
    (cons e ls)
    (cons (car ls) (insertaOrdenado e (cdr ls)))))))