% Cuerpo de conocimiento
% Hechos

% hombre/1: determina que su argumento es una persona de sexo masculino
hombre('Mateo').
hombre('Santiago').
hombre('Tomas').
hombre('Joaquin').
hombre('Benjamin').
hombre('Nicolas').
hombre('Lautaro').
hombre('Bruno').

% mujer/1: determina que su argumento es una persona de sexo femenino.
mujer('Ana').
mujer('Camila').
mujer('Lucia').
mujer('Valentina').
mujer('Sofia').
mujer('Julieta').
mujer('Martina').

% progenitor/2: determina que el primer argumento es progenitor (madre o padre) del segundo.
progenitor('Mateo', 'Benjamin').
progenitor('Ana', 'Benjamin').

progenitor('Santiago', 'Sofia').
progenitor('Camila', 'Sofia').

progenitor('Tomas', 'Nicolas').
progenitor('Lucia', 'Nicolas').

progenitor('Joaquin', 'Julieta').
progenitor('Valentina', 'Julieta').

progenitor('Benjamin', 'Martina').
progenitor('Sofia', 'Martina').

progenitor('Nicolas', 'Lautaro').
progenitor('Julieta', 'Lautaro').

progenitor('Martina', 'Bruno').
progenitor('Lautaro', 'Bruno').

% Reglas

% a
padre(X, Y) :- progenitor(X, Y), hombre(X).

% b
madre(X, Y) :- progenitor(X, Y), mujer(X).

% c
abuelo(X, Y) :- progenitor(X,Z), progenitor(Z,Y), hombre(X).

% d
abuela(X, Y) :- progenitor(X,Z), progenitor(Z,Y), mujer(X).

% e
hermano(X,Y) :- padre(P,X), madre(M,X), padre(P,Y), madre(M,Y), X\=Y.

% f
hermano_varon(X,Y) :- hermano(X,Y), hombre(X).

% g
hermana_mujer(X,Y) :- hermano(X,Y), mujer(X).

% h
sucesor(X,Y) :- progenitor(Y,X).
sucesor(X,Y) :- sucesor(X,Z), progenitor(Y,Z).


