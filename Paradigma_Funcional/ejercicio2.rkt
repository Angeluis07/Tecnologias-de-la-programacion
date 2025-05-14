(cons 'car '+)
```
Crea un par (pair) con 'car como primer elemento y '+ como segundo.  
**Devuelve:**  
```racket
'(car . +)
```

````racket
(list 'esto '(es muy facil))
```
Crea una lista con dos elementos: el símbolo 'esto y la lista '(es muy facil).  
**Devuelve:**  
```racket
'(esto (es muy facil))
```

````racket
(cons 'pero '(se está complicando...)) (cons '(y ahora no se que ) 'hizo)
```
Primera parte:  
`(cons 'pero '(se está complicando...))`  
Agrega 'pero al inicio de la lista '(se está complicando...).  
**Devuelve:**  
```racket
'(pero se está complicando...)
```
Segunda parte:  
`(cons '(y ahora no se que ) 'hizo)`  
Crea un par donde el primer elemento es la lista '(y ahora no se que) y el segundo es 'hizo.  
**Devuelve:**  
```racket
'((y ahora no se que) . hizo)
```

````racket
(quote (+ 7 2))
```
Devuelve la lista literal (+ 7 2) sin evaluarla.  
**Devuelve:**  
```racket
'(+ 7 2)
```

````racket
(cons '+ '(10 3)) (car '(+ 10 3)) (cdr '(+ 10 3)) cons
```
Primera parte:  
`(cons '+ '(10 3))`  
Agrega '+ al inicio de la lista '(10 3).  
**Devuelve:**  
```racket
'(+ 10 3)
```
Segunda parte:  
`(car '(+ 10 3))`  
Devuelve el primer elemento de la lista, que es '+.  
**Devuelve:**  
```racket
'+
```
Tercera parte:  
`(cdr '(+ 10 3))`  
Devuelve la cola de la lista, es decir, '(10 3).  
**Devuelve:**  
```racket
'(10 3)
```
La palabra `cons` sola no hace nada útil aquí; si la ejecutas, devuelve la función cons.

````racket
(quote (cons (car (cdr (7 4)))) ) (quote cons) (car (quote (quote cons)))
```
Primera parte:  
`(quote (cons (car (cdr (7 4)))) )`  
Devuelve la lista literal (cons (car (cdr (7 4)))).  
**Devuelve:**  
```racket
'(cons (car (cdr (7 4))))
```
Segunda parte:  
`(quote cons)`  
Devuelve el símbolo 'cons.  
**Devuelve:**  
```racket
'cons
```
Tercera parte:  
`(car (quote (quote cons)))`  
Devuelve el primer elemento de la lista '(quote cons), que es 'quote.  
**Devuelve:**  
```racket
'quote
```

````racket
(+ 2 3)
```
Suma 2 y 3.  
**Devuelve:**  
```racket
5
```

````racket
(+ '2 '3)
```
Suma los símbolos '2 y '3. En Racket, esto genera un error porque no puedes sumar símbolos.

````racket
(+ (car '(2 3)) (car (cdr '(2 3)))) ((car (list + - * /)) 2 3)
```
Primera parte:  
`(+ (car '(2 3)) (car (cdr '(2 3))))`  
- `(car '(2 3))` devuelve 2  
- `(cdr '(2 3))` devuelve '(3)  
- `(car '(3))` devuelve 3  
- Suma 2 + 3  
**Devuelve:**  
```racket
5
```
Segunda parte:  
`((car (list + - * /)) 2 3)`  
- `(list + - * /)` crea la lista de funciones  
- `(car ...)` toma la función +  
- `(+ 2 3)`  
**Devuelve:**  
```racket
5
```

**Nota:** Si ejecutas todas las líneas juntas, recuerda que algunas expresiones pueden causar error (como sumar símbolos).  
¿Te gustaría que te explique alguna línea con más detalle?