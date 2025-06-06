% Escriba un predicado en Prolog de aridad 6 que implemente
% la funcinon reemplazar, la cual recibira los siguientes parametros

%1. El elemento a reemplazar en la primera lista.
%2. El elemento de reemplazo.
%3. A partir de qué instancia encontrada comienza a reemplazar (validar que sus valor sea >= 1).
%4. Cuántos reemplazos como máximo se harán (siendo -1 el valor para indicar que reemplace todas las instancias que encuentre; validar que su valor sea -1 o >= 1).
%5. Una lista de elementos en donde se reemplazara.
%6. El ultimo parametro debe unificar con la lsita resultante.

%?- reemplazar(1,2,3,4,5,6). // reemplazar(elem_a_rem,elem_rem,a_partir_de,max_rem,List,ListRemp).

reemplazar(_,_,Inicio,_,_,_) :-
    Inicio < 1,
    write('El valor de inicio debe ser mayor o igual a 1'),
    fail.
reemplazar(_,_,_,CantRem,_,_) :-
    CantRem < 1,
    CantRem \= 1,
    write('La cantidad de reemplazos debe ser mayor o igual a 1'),
    fail.