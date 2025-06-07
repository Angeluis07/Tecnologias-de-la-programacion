% Escriba un predicado en Prolog de aridad 6 que implemente
% la funcinon reemplazar, la cual recibira los siguientes parametros

% 1. El elemento a reemplazar en la primera lista.
% 2. El elemento de reemplazo.
% 3. A partir de qué instancia encontrada comienza a reemplazar (validar que sus valor sea >= 1).
% 4. Cuántos reemplazos como máximo se harán (siendo -1 el valor para indicar que reemplace todas las instancias que encuentre; validar que su valor sea -1 o >= 1).
% 5. Una lista de elementos en donde se reemplazara.
% 6. El ultimo parametro debe unificar con la lsita resultante.

reemplazar(_,_,Inicio,_,_,_) :-
    Inicio < 1,
    write('El valor de inicio debe ser mayor o igual a 1'),
    !,
    fail.
reemplazar(_,_,_,CantRem,_,_) :-
    CantRem < 1,
    CantRem \= -1,
    write('La cantidad de reemplazos debe ser mayor o igual a 1'),
    !,
    fail.


/*
Para que prolog muestre listas largas hay que poner el siguiente comando:
set_prolog_flag(answer_write_options,[max_depth(0)]).
Si no se pone, prolog corta las listas largas y no muestra el resultado completo.
*/


% wrapper
reemplazar(ElemARem, ElemRem, Inicio, CantRem, Lista, ListaRemp) :-
    Contador = 0,
    reemplazar(ElemARem, ElemRem, Inicio, CantRem, Lista, ListaRemp, Contador).


reemplazar(_,_,_,_,[],[],_) :- !.
reemplazar(ElemARem, ElemRem, Inicio, CantRem, [X|Cola], [ElemRem|Cola2], Contador) :-
    ElemARem = X,
    CantRem \= 0,
    Contador2 is Contador + 1,
    Contador2 >= Inicio,
    CantRem2 is CantRem - 1,
    reemplazar(ElemARem, ElemRem, Inicio, CantRem2, Cola, Cola2, Contador2).
reemplazar(ElemARem, ElemRem, Inicio, CantRem, [X|Cola], [X|Cola2], Contador) :-
    ElemARem = X,
    CantRem = 0,
    Contador2 is Contador + 1,
    Contador2 >= Inicio,
    reemplazar(ElemARem, ElemRem, Inicio, CantRem, Cola, Cola2, Contador2).
reemplazar(ElemARem, ElemRem, Inicio, CantRem, [X|Cola], [X|Cola2], Contador) :-
    ElemARem = X,
    Contador2 is Contador + 1,
    Contador2 < Inicio,
    reemplazar(ElemARem, ElemRem, Inicio, CantRem, Cola, Cola2, Contador2).
reemplazar(ElemARem, ElemRem, Inicio, CantRem, [X|Cola], [X|Cola2], Contador) :-
    ElemARem \= X,
    reemplazar(ElemARem, ElemRem, Inicio, CantRem, Cola, Cola2, Contador).



    