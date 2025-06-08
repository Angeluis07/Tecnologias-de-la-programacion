; ElemR -> Elemento a remplazar
; Rem -> Elemento de remplazo
(define (subst ElemR Rem Lista)
    (if (null? Lista)
        '()
        (cons (if (equal? ElemR (car Lista))
            Rem
            (car Lista)
        )(subst ElemR Rem (cdr Lista)))
    )
)