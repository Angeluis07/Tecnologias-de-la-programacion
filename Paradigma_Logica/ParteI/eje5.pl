% Hechos: rutas directas entre ciudades
ruta(santafe, parana).
ruta(parana, corrientes).
ruta(santafe, cordoba).
ruta(santafe, coronda).
ruta(santafe, rosario).
ruta(rosario, capital).
ruta(rosario, mardelplata).
ruta(capital, cordoba).

% Nuevas rutas agregadas en tu ejemplo
ruta(corrientes, mardelplata).
ruta(mardelplata, cordoba).

% Predicado recursivo para buscar conexiones directas e indirectas
conecta(X, Y) :- ruta(X, Y).
conecta(X, Y) :- ruta(X, Z), conecta(Z, Y).

% ------------------------
% Consultas de ejemplo
% ------------------------

% ¿Qué destinos son alcanzables desde Paraná?
% ?- conecta(parana, Destino).

% ¿Se puede llegar desde Paraná a Córdoba?
% ?- conecta(parana, cordoba).

% ¿Desde qué lugares se puede llegar a Córdoba?
% ?- conecta(Origen, cordoba).

% ¿Hay alguna combinación de dos rutas para ir de Santa Fe a Corrientes?
% ?- ruta(santafe, X), ruta(X, corrientes).


