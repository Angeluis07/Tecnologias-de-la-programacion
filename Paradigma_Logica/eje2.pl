padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(alberto, juan).
padre(alberto, pedro).
padre(alberto, luis).
padre(geronimo, luisa).
hermano(A, B):- padre(P, A), padre(P, B), A \= B, write([A, B]), nl, fail.
abuelo(A, B):- padre(A, P), padre(P, B).
nieto(X, Y):- padre(Y, Z), padre(Z, X).