% insertar_ordenado(X, lista, lista_ordenada)
insertar_ordenado(X, [], [X]).
insertar_ordenado(X, [Y|Cola], [X,Y|Cola]) :-
    X =< Y.
insertar_ordenado(X, [Y|Cola], [Y|Listaord]) :-
    X > Y,
    insertar_ordenado(X, Cola, Listaord).
