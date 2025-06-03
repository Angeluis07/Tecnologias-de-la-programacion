mayoracero(X) :- X>=0.
factorial(0,1).
factorial(X,Y) :- mayoracero(X), AUX is X-1,factorial(AUX,AUX2),Y is AUX2*X.