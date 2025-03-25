is_empty([]).


is_single_element([_]).


first_element(X, [X|_]).


last_element(X, [X]).
last_element(X, [_|Y]) :- last_element(X, Y).
% per ipotesi induttiva io so chiamare last_element(X, LIST)
% passo induttivo: X è la lista Y se X è l'ultimo elemento. 
% last_element(LIST, [1,21,sd,3]) si in C
% last_element(3, [1,21,sd,3]) in C non lo verifica perchè in 
% prolog ho una relazione tra (X, LISTA) 
% quindi stiamo risolvendo tutti i problemi che coinvolgono la relazione tra questi due oggetti
% last_element(4, LIST) non in C
% last_element(X, LIST) non in C
% last_element(X, [[cane,gatto],[leone],[giraffa,minollo,gg]]) non in C


last_but_one(X, [X,_]).
last_but_one(X, [_|Y]) :- last_but_one(X, Y).


sum(A+B, A, B).
sum_list(S, [S]).
sum_list(S, [H|T]) :- 
    sum_list(S1, T), sum(S, S1, H).


% calcolo il numero di elementi di una lista
e_num_list(0, []).
e_num_list(1, [_]).
e_num_list(N, [H|T]) :- 
    e_num_list(N1, T), N is N1+1.


% elemento K'esimo della lista
element_at(X, [X|_], 0).
element_at(X, [_|T], K) :- 
    K>0, K1 is K-1, element_at(X, T, K1).


% reverse della lista
