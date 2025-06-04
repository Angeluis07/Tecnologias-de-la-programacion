suma([],0).
suma([X|Lista],Sumador) :- suma(Lista,AUX), Sumador is X + AUX.
