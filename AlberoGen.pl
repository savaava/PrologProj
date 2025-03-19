%FATTI
padre(mario,manuela).
padre(mario,giulia).
padre(mario,bruno).
coniuge(mario,sandra).

padre(salvatore,giovanni).
coniuge(salvatore,giulia).

padre(brunosenior,mario).
coniuge(brunosenior,angela).

%REGOLE
genitore(X,Y) :- 
    padre(X,Y).

madre(X,Y) :-
    coniuge(Z,X), padre(Z,Y).

genitore(X,Y) :-
    madre(X,Y).

antenato(X,Y) :- genitore(X,Y).
antenato(X,Y) :- genitore(X,Z), antenato(Z,Y).

fratello_sorella(X,Y) :-
    padre(Z,X), padre(Z,Y), madre(W,X), madre(W,Y), X\=Y.
zio_zia(X,Y) :-
    genitore(Z,Y), fratello_sorella(Z,X).