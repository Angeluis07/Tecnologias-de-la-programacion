% Cuerpo de conocimiento
% Hechos

% comida de entrada
entrada('ensalada').
entrada('sopa').
entrada('bruschetta').

% comida principal
principal('pasta').
principal('pizza').
principal('paella').

% comida de postre
postre('helado').
postre('tarta').
postre('fruta').

% Predicados

carta(X,Y,Z) :- entrada(X), principal(Y), postre(Z), write([X, Y ,Z]), nl, fail.