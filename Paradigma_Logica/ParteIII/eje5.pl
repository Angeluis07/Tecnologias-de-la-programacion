positivos([],[]).
positivos([X|Cola],[X|ListaPos]) :- X > 0, positivos(Cola,ListaPos).
positivos([X|Cola],ListaPos) :- X < 0, positivos(Cola,ListaPos). 