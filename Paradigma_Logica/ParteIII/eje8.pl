profundidad([N], 1).
profundidad([], 0).
profundidad([I, N, D], Max) :-
    profundidad(I, MaxI),
    profundidad(D, MaxD),
    MaxI >= MaxD,
    Max is MaxI + 1.
profundidad([I, N, D], Max) :-
    profundidad(I, MaxI),
    profundidad(D, MaxD),
    MaxI < MaxD,
    Max is MaxD + 1.

profundidad_en_aristas(Arbol, Prof) :-
    profundidad(Arbol, Nodos),
    Nodos > 0,
    Prof is Nodos - 1.

profundidad_en_aristas([], 0).  % por definición