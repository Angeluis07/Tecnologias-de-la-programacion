#lang racket

;Describa los pasos necesarios para evaluar la siguiente expresión:
;((car (cdr (cdr (list + - * /)))) 5 5)

; Paso 1: Evaluar (list + - * /)
; Esto crea una lista con las funciones +, -, *, y /.
; Paso 2: Evaluar (cdr (list + - * /))
; Esto devuelve la lista sin el primer elemento, que es '-'.
; Paso 3: Evaluar (cdr (cdr (list + - * /)))
; Esto devuelve la lista sin los dos primeros elementos, que es '(* /)'.
; Paso 4: Evaluar (car (cdr (cdr (list + - * /))))
; Esto devuelve la primera función de la lista resultante, que es '*'.
; Paso 5: Evaluar ((car (cdr (cdr (list + - * /)))) 5 5)
; Esto aplica la función '*' a los argumentos 5 y 5, resultando en 25.