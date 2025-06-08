;La distancia entre dos puntos
(define (distance2d Punto1 Punto2)
  (let*
      ([DeltaX (-(car Punto2) (car Punto1))]
       [DeltaY (-(cdr Punto2) (cdr Punto1))])
    (sqrt (+ (* DeltaX DeltaX) (* DeltaY DeltaY)))))

;Otra forma
;En Racket, let* es una variante de let que permite definir
;variables secuencialmente, es decir, cada variable puede usar los valores
;de las variables definidas antes en el mismo bloque porque se definen en orden.
(define (distance2d2 Punto1 Punto2)
  (let*
      ([DeltaX (-(car Punto2) (car Punto1))]
       [DeltaY (-(cdr Punto2) (cdr Punto1))]
       [Delta2X (* DeltaX DeltaX)]
       [Delta2Y (* DeltaY DeltaY)])
    (sqrt (+ Delta2X Delta2Y))))

