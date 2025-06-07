;La distancia entre dos puntos
(define (distance2d Punto1 Punto2)
  (let
      ([DeltaX (-(car Punto2) (car Punto1))]
       [DeltaY (-(cdr Punto2) (cdr Punto1))])
    (sqrt (+ (* DeltaX DeltaX) (* DeltaY DeltaY)))))
