#lang racket

;1) sumar los números de una lista
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

;5) Elimina el elemento de una lista
(define eliminar
 (lambda (e ls)
  (if (null? ls)
   '()
   (if (equal? e (car ls))
    (cdr ls)
    (cons (car ls) (eliminar e (cdr( ls))))))))

;6) Ordenar las palabras por su peso
(define ordenarAux
 (lambda (lista1 lista2)
  (if (null? lista1)
   lista2
   (ordenarAux (cdr lista1) (insertaOrdenado (car lista1) lista2)))))

;7) Ordenar Wrapper
(define ordenar
 (lambda (ls)
  (ordenarAux (listaPesos ls) '())))

(displayln (ordenar '("moto" "auto" "casa" "juego" "aire")))