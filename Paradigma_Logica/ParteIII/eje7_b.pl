contar(_, [], 0).
contar(X, [Y|Lista], Cant) :- Y == X, contar(X, Lista, Cant1), Cant is Cant1 + 1.
contar(X, [Y|Lista], Cant) :- Y \= X, contar(X, Lista, Cant).

eliminar_dup2([],[]).
eliminar_dup2([X|Cola],[X|SinDup]) :-
  contar(X,Cola,Cant),
  Cant = 0,
  eliminar_dup2(Cola,SinDup).
eliminar_dup2([X|Cola],SinDup) :-
  eliminar_dup2(Cola,SinDup).
