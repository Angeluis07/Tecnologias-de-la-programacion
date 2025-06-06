eliminar_primero([],Elem,[]).
eliminar_primero([X|Cola],Elem,Cola) :-
    X = Elem,
    !.
eliminar_primero([X|Cola],Elem,[X|Lista]) :-
    X \= Elem,
    eliminar_primero(Cola,Elem,Lista).

