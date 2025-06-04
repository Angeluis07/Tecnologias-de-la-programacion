% Eliminar ocurrencias de un elemento en una Lista
eliminar_elemento(_,[],[]).
eliminar_elemento(E,[E|R],Resultado) :- eliminar_elemento(E,R,Resultado).
eliminar_elemento(E,[X|R],[X|Resultado]) :- E \= X, eliminar_elemento(E,R,Resultado).
