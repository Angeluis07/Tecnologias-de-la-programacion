contar(_, [], 0).
contar(X, [Y|Lista], Cant) :- Y == X, contar(X, Lista, Cant1), Cant is Cant1 + 1.
contar(X, [Y|Lista], Cant) :- Y \= X, contar(X, Lista, Cant).