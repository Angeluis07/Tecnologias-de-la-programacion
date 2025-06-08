#|
Defina un procedimiento en Racket llamado attach-at-end que reciba como parámetro un valor y una
lista y retorne la lista con los mismos valores excepto el que se pasó por parámetro que se agregará
al final.
Ej: (attach-at-end 'prueba '(esto es una)) → (esto es una prueba)
|#

(define (attach-at-end valor Lista)
    (if(null? Lista)
        (list valor)
        (cons (car Lista) (attach-at-end valor (cdr Lista)))
    )
)
