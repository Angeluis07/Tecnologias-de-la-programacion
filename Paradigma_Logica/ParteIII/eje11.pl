% recibe una lista cuyos elementos pueden ser otra listar y
% debe retornar una lista con todos los elementos atomicos presentes

% ?- aplanar([1, 2, [3]], ListaPlana).
% ListaPlana = [1, 2 ,3].

aplanar([],[]).
aplanar([X],X).
aplanar([X|Cola],[X|ListaPlana]) :-
    aplanar(Cola,ListaPlana).