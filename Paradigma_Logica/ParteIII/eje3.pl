cantidad([],0).
cantidad([_|Lista],Elementos) :- cantidad(Lista,AUX), Elementos is AUX + 1.