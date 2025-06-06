% Semejanza entre dos listas
cantidad([], 0).
cantidad([_|Lista], Elementos) :- cantidad(Lista, AUX), Elementos is AUX + 1.

semejanza([], [], 0) :- !.

semejanza([], Lista, S) :-
  cantidad(Lista,Tam),
  S is -Tam,
  !.

semejanza(Lista, [], S) :-
  cantidad(Lista,Tam),
  S is -Tam,
  !.

semejanza([X|Cola1], [Y|Cola2], S) :-
  X = Y,
  semejanza(Cola1,Cola2,S2),
  S is S2 + 1.

semejanza([X|Cola1], [Y|Cola2], S) :-
  X \= Y,
  semejanza(Cola1,Cola2,S2),
  S is S2 - 1.


% Diccionario del ejercicio 6
dic([sanar, hola, sabana, sabalo, prueba, computadora, cartera, mate, termo, mesa, silla,
sarna]).


% Busca si un Atomo se encuentra dentro de una lista
buscar_list(Atomo,[]) :- !.
buscar_list(Atomo, [X|Cola]) :-
    Atomo = X,
    !.
buscar_list(Atomo, [X|Cola]) :-
    Atomo \= X,
    buscar_list(Atomo,Cola).


% Busca un Atomo dentro del diccionario, si lo encuentra lo devuelve como una lista de un elemento
buscar_dic(Atomo) :-
  dic(L),
  buscar_list(Atomo, L).

buscar(Atomo, [L]) :-
  buscar_dic(Atomo),
  L = Atomo,
  !.

% Tengo que pasar a atom_chars cada uno de los elementos del diccionario y recorrer con recursividad
buscar(Atomo, L) :-
  atom_chars(Atomo,L_Atomo),



