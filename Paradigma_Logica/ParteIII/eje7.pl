% Eliminar ocurrencias de un elemento en una Lista
eliminar_elemento(_,[],[]).
eliminar_elemento(E,[E|R],Resultado) :- eliminar_elemento(E,R,Resultado).
eliminar_elemento(E,[X|R],[X|Resultado]) :- E \= X, eliminar_elemento(E,R,Resultado).

eliminar_dup([],[]).
eliminar_dup([X|R],[X|Resultado]) :-
  eliminar_elemento(X,R,Limpia), eliminar_dup(Limpia, Resultado).
