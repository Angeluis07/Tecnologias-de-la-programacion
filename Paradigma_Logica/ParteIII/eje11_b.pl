% aplanar(+ListaAnidada, -ListaPlana)
% Recibe una lista posiblemente anidada y devuelve una lista plana con todos los elementos atómicos.

aplanar([], []).  % Caso base: la lista vacía se aplana como lista vacía.

% Si el primer elemento es una lista (o potencialmente una lista), lo aplanamos recursivamente,
% luego aplanamos el resto de la lista, y finalmente unimos ambos resultados.
aplanar([Elemento|Resto], ListaPlana) :-
    aplanar(Elemento, ElementoPlano),      % Aplana el primer elemento (puede ser lista o átomo)
    aplanar(Resto, RestoPlano),            % Aplana el resto de la lista
    unir(ElementoPlano, RestoPlano, ListaPlana). % Une ambos resultados en una sola lista

% Caso base para átomos: si el elemento no es una lista ni vacío, lo devolvemos como lista de un solo elemento.
aplanar(Atomo, [Atomo]) :-
    Atomo \= [],
    Atomo \= [_|_].

% unir(+Lista1, +Lista2, -Resultado)
% Une dos listas en una sola (implementación de append sin usar append).
unir([], Lista, Lista).  % Si la primera lista está vacía, el resultado es la segunda lista.
unir([Cabeza|Cola], Lista, [Cabeza|Resultado]) :-
    unir(Cola, Lista, Resultado).  % Toma la cabeza de la primera lista y sigue uniendo el resto.