;Funcion para concatenar
(define (concatenar L1 L2)
    (if(null? L1)
        L2
        (cons (car L1) (concatenar (cdr L1) L2))
    )
)