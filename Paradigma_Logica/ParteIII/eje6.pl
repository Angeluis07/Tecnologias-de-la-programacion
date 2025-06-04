cantidad([],0) :- !.
cantidad([_|Lista],Elementos) :- cantidad(Lista,AUX), Elementos is AUX + 1.

suma_lista([],[],[]).
suma_lista([X|Cola],[Y|Cola2],[Z|ListaSuma]) :- 
    cantidad([Cola],Aux),
    cantidad([Cola2],Aux2),
    Aux == Aux2,
    Z is X + Y,
    suma_lista(Cola,Cola2,ListaSuma).