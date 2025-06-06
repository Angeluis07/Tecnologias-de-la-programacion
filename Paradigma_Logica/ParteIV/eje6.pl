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
buscar_list(_,[]) :- fail.
buscar_list(Atomo, [X|_]) :-
    Atomo = X,
    !.
buscar_list(Atomo, [X|Cola]) :-
    Atomo \= X,
    buscar_list(Atomo,Cola).

% Busca un Atomo dentro del diccionario
buscar_dic(Atomo) :-
  dic(L),
  buscar_list(Atomo, L).

% Busca un Atomo dentro del diccionario, si lo encuentra lo devuelve como una lista de un elemento
buscar(Atomo, [L]) :-
  buscar_dic(Atomo),
  L = Atomo,
  !.

% La funcion buscar es un wrapper que hace uso de semejana_dic
buscar(Atomo, L) :-
  atom_chars(Atomo,AtomoListado),
  dic(ListDic),
  semejanza_dic(AtomoListado,ListDic,L2),
  L = L2.

% Recorro todos los elementos de mi diccionario y calculo su semejanza con el Atomo
% solicitado, en caso de que la semejanza sea mayo a 0 se guarda en un lista
% tanto la palabra como el valor de semejanza recibido

semejanza_dic(_,[],[]) :- !.
semejanza_dic(AtomoListado,[X|Cola],[[X,S]|ColaL]) :-
    atom_chars(X,XListado),
    semejanza(AtomoListado,XListado,S),
    S > 0,
    semejanza_dic(AtomoListado,Cola,ColaL).
semejanza_dic(AtomoListado,[X|Cola],ColaL) :-
    atom_chars(X,XListado),
    semejanza(AtomoListado,XListado,S),
    S =< 0,
    semejanza_dic(AtomoListado,Cola,ColaL).
  







