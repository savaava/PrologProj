%FATTI
padre(antonio, andreaIo).
padre(antonio, marco).
padre(franco, andreaF).
padre(franco, roberta).
padre(manrico, mariapaola).
padre(manrico, mauro).

padre(andrea, antonio).
padre(andrea, franco).
padre(andrea, agnese).

madre(carmen, andreaIo).
madre(carmen, marco).
madre(gabriella, andreaF).
madre(gabriella, roberta).
madre(agnese, mariapaola).
madre(agnese, mauro).

madre(lidia, antonio).
madre(lidia, franco).
madre(lidia, agnese).

%REGOLE
genitore(X, Y) :- 
    padre(X, Y); madre(X, Y).

coniuge(X, Y) :- 
    padre(X, Z), madre(Y, Z).

fratello_sorella(X, Y) :- 
    madre(Z, X), madre(Z, Y), 
    padre(W, X), padre(W, Y), 
    X \= Y.

zio_zia(X, Y) :- 
    genitore(Z, Y), fratello_sorella(Z, X).
