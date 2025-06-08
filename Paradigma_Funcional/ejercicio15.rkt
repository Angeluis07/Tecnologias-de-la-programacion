;
(define (primer-num Lista)
    (if(null? Lista)
        #f
        (if(number? (car Lista))
            (car Lista)
            (primer-num (cdr Lista))
        )
    )
)