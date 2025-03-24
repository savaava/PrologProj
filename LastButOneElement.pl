lastbutone(X, [X,_]).
lastbutone(X, [_|Y]) :- lastbutone(X, Y).