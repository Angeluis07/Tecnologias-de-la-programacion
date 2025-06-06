cantidad([], 0).
cantidad([_|Lista], Elementos) :- cantidad(Lista, AUX), Elementos is AUX + 1.

semejanza([], [], 0) :- !.

semejanza([], Lista, S) :-
  cantidad(Lista,Tam),
  S is -Tam,
  !.

semejanza(Lista, Tam, S) :-
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


dic([sanar, hola, sabana, sabalo, prueba, computadora, cartera, mate, termo, mesa, silla,
sarna]).

buscar(Atomo, Lista) :-
  