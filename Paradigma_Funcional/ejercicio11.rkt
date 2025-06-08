(define (count-elem Elem Lista)
    (if (null? Lista)
        0
        (+ (if (equal? Elem (car Lista))
            1
            0
        )(count-elem Elem (cdr Lista)))
    )
)