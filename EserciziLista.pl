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
e_num_list(N, [_|TAIL]) :- 
    e_num_list(N2, TAIL), N is N2+1.


% elemento K'esimo della lista
element_at(X, [X|_], 0).
element_at(X, [_|T], K) :- 
    K>0, K1 is K-1, element_at(X, T, K1).


% liste uguali
list_is_equal([], []).
list_is_equal([H1|T1], [H2|T2]) :- 
    H1=H2, list_is_equal(T1, T2).


% Rimuovere il primo elemento della lista
is_tail(T, [_|T]).
is_head(H, [H|_]).


is_second_element(S, [_,S|_]).


% predicato is_sorted L è vero se L è ordinata
is_sorted([]).
is_sorted([_]).
is_sorted([H|T]) :- 
    is_sorted(T), is_head(H1, T), H1>=H.


% predicato num_occorrenze
num_occorrenze(0, [], _).
num_occorrenze(N, [H|T], E) :-
    (num_occorrenze(N2, T, E), H=E, N is N2+1);
    (num_occorrenze(N2, T, E), H\=E, N is N2).


% Srivi predicato vero se data L1 e L2 la lista L3 è concatenazione di L1,L2



% Rimuovere l'ultimo elemento
list_no_last(L1, [L1]).
list_no_last(L1, [H|T]) :- 
    list_no_last([H|L1], T).


% reverse della lista
my_reverse(L1,L2) :- my_rev(L1,L2,[]).
my_rev([],L2,L2) :- !.
my_rev([X|Xs],L2,Acc) :- my_rev(Xs,L2,[X|Acc]).