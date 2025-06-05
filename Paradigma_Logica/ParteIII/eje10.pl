men_elem([X], X).
men_elem([X|Cola], X) :-
    men_elem(Cola, MenorCola),
    X =< MenorCola.
men_elem([X|Cola], MenorCola) :-
    men_elem(Cola, MenorCola),
    X > MenorCola.

eliminar_elemento(_,[],[]).
eliminar_elemento(E,[E|R],Resultado) :- eliminar_elemento(E,R,Resultado).
eliminar_elemento(E,[X|R],[X|Resultado]) :- E \= X, eliminar_elemento(E,R,Resultado).


% Ordena una lista de manera ascendente
ordenar_lista([],[]).
ordenar_lista(Lista,[Menor|Ordenada]):-
    men_elem(Lista, Menor),
    eliminar_elemento(Menor, Lista, Resultado),
    ordenar_lista(Resultado, Ordenada).
