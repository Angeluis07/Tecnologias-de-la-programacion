agregar_nuevo(Elem,[],[Elem]).
agregar_nuevo(Elem,[X|Cola],[X|Cola]) :-
    X = Elem,
    !.
agregar_nuevo(Elem,[X|Cola],[X|Lista]) :-
    X \= Elem,
   agregar_nuevo(Elem,Cola,Lista).