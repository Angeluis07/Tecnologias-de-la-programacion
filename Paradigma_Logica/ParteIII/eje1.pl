factorial(0,1).
factorial(X,Y) :- x > 0, AUX is X-1,factorial(AUX,AUX2),Y is AUX2 * X.