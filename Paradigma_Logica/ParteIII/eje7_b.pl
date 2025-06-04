contar(_, [], 0).
contar(X, [Y|Lista], Cant) :- Y == X, contar(X, Lista, Cant1), Cant is Cant1 + 1.
contar(X, [Y|Lista], Cant) :- Y \= X, contar(X, Lista, Cant).

eliminar_dup([],[]).
eliminar_dup([X|Cola],[X|SinDup]) :- 
  contar(X,Cola,Cant),
  Cant = 0,
  eliminar_dup(Cola,SinDup).
eliminar_dup([X|Cola],SinDup) :-
  eliminar_dup(Cola,Sindup).
    
