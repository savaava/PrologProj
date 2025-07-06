% DERIVATE per funzioni sinusoidali
% D cos(x) -> -sin(x)
% D sin(x) -> cos(x)
% il sistema non è completo ma è coerente

% la x mi serve perchè poi ho per derivate composte
deriva(sin(x),cos(x), x).
deriva(cos(x),-sin(x), x).
deriva(log(x),1/x, x).
deriva(exp(x),exp(x), x).

% f(-x) = -f(-x) per le funzioni considerate
deriva(sin(-x), -cos(-x), x).
deriva(cos(-x), sin(-x), x).
deriva(log(-x), -1/x, x).
deriva(exp(-x), -exp(-x), x).

% Kf(X), dove K è una costante
deriva(K*F, K*DF, X) :-
    myconstant(K),
    deriva(F, DF, X).

deriva(N, 0, _) :- 
    myconstant(N).

deriva(X^N, N*X^(N-1), X) :-
    integer(N).

deriva(X, 1, X).

deriva(F+G, DF + DG, X) :- 
    deriva(F, DF, X),
    deriva(G, DG, X).

deriva(F*G, DF*G + F*DG, X) :-
    deriva(F, DF, X),
    deriva(G, DG, X).

deriva(F/G, (DF*G - F*DG)/(G^2), X) :-
    deriva(F, DF, X),
    deriva(G, DG, X).

% definiamo la costante come un valore intero, o reale, o un valore atomico
myconstant(K) :- integer(K).
myconstant(K) :- number(K).
myconstant(K) :- atomic(K).