% vero se G è la derivata di F rispetto ad x
% deriva(F, DF, x). 

% poichè x è costante adesso mi perdo le funzioni composte, ed è una costante per me
deriva(sin(x), cos(), x).
deriva(cos(x), -sin(x), x).
deriva(exp(x), exp(x), x).
deriva(log(x), 1/x, x).

n_is_constant(N):-
    integer(N); atomic(N); number(N).

deriva(N, 0, x):-
    n_is_constant(N).

deriva(X, 1, X).

deriva(x^N, N*x^(N-1), x) :-
    n_is_constant(N).

deriva(K*F, K*DF, X) :-
    deriva(F, DF, X), n_is_constant(K).

deriva(F+G, DF+DG, X) :-
    deriva(F, DF, X), deriva(G, DG, X).
deriva(F-G, DF-DG, X) :-
    deriva(F, DF, X), deriva(G, DG, X).

deriva(F*G, (DF*G+F*DG), X) :-
    deriva(F, DF, X), deriva(G, DG, X).
deriva(F/G, (DF*G-F*DG)/G^2, X) :-
    deriva(F, DF, X), deriva(G, DG, X).