;siempre conviene hacer funciones chicas y utilizar wrapper para utilizar esas funciones

;hay que identificar que funciones hay que hacer

;tomo el primer elemento y recorro toda la lista juntando toda la lista

;agruparE agrupa por elemento
(define (agruparE Elem Lista)
    (if (null? Lista)
        '()
        (if (equal? Elem (car Lista))
            (cons Elem (agruparE Elem (cdr Lista)))
            (agruparE Elem (cdr Lista)))
    )
)
;elimE devuelve una lista sin ese elemento
(define (elimE Elem Lista)
    (if (null? Lista)
        '()
        (if (equal? Elem (car Lista))
            (elimE Elem (cdr Lista))
            (cons (car Lista) (elimE Elem (cdr Lista))))
    )
)

(define (agrupar Lista)
    (if (null? Lista)
        '()
        (cons (agruparE (car Lista) Lista) (agrupar (elimE (car Lista) Lista))
        )
    )
)

; devuelve true si un elemento X esta dentro de una lista (No la uso)
(define (find X Lista)
    (if (null? Lista)
        #f
        (if(equal? X (car Lista))
        #t
        (find X (cdr Lista))
        )
    )
)