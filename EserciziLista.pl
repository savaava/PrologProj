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


% Ricerca se un elemento E è presente in una lista
is_E_present(E, [E|_]).
is_E_present(E, [_|T]) :- is_E_present(E, T).
% Se E è la testa, restituisce true.
% Se E non è la testa, richiama is_E_present(E, TC),
% ripetendo il processo finché trova A o la lista diventa vuota.
%              membro(a, [1,2,a,66]).
%   Call: (12) membro(a, [1, 2, a, 66])
%   Call: (13) membro(a, [2, a, 66])
%   Call: (14) membro(a, [a, 66]) 
%   Exit: (14) membro(a, [a, 66]) 
%   Exit: (13) membro(a, [2, a, 66])
%   Exit: (12) membro(a, [1, 2, a, 66])


% somma degli elementi di una lista
sum(A+B, A, B).
sum_list(S, [S]).
sum_list(S, [H|T]) :- 
    sum_list(S1, T), sum(S, S1, H).


% calcolo il numero di elementi di una lista
e_num_list(0, []).
e_num_list(N, [_|TAIL]) :- 
    e_num_list(N2, TAIL), N is N2+1.


% elemento K'esimo della lista
extract_k(XK, 0, [XK|_]).  % extract_k(XK, K, [XK|_]) :- K is 0.
extract_k(XK, K, [_|T]) :- 
    K>0, K2 is K-1, extract_k(XK, K2, T).


% liste uguali
are_lists_equals([], []).
are_lists_equals([H|T1], [H|T2]) :- are_lists_equals(T1, T2). 
% are_lists_equals([H1|T1], [H2|T2]) :- H1=H2, are_lists_equals(T1, T2).


% Rimuovere il primo elemento della lista
no_head_list([], []).
no_head_list(T, [_|T]).


% Rimuovere l'ultimo elemento dalla lista
no_last_element([], [_]).
no_last_element([H|T1], [H|T2]) :- no_last_element(T1, T2).


is_second_element(S, [_,S|_]).

is_head(H, [H|_]).

% predicato is_sorted L è vero se L è ordinata
is_greater(X1, X2) :- X1>=X2.
is_sorted([]).
is_sorted([_]).
is_sorted([H1, H2 | T]) :- is_greater(H2, H1), is_sorted([H2|T]).


% predicato num_occorrenze
num_occorrenze(0, [], _).
num_occorrenze(N, [H|T], E) :-
    (num_occorrenze(N2, T, E), H=E, N is N2+1);
    (num_occorrenze(N2, T, E), H\=E, N is N2).
%num_occ(L,Elem,Occ) vero se Occ è il numero di occorrenze di Elem nella Lista L
num_occ([],_,0).
num_occ([Elem|Coda],Elem,Occ) :-
    num_occ(Coda,Elem,Occ1),
    Occ is Occ1 + 1.
num_occ([Testa|Coda],Elem,Occ) :-
    num_occ(Coda,Elem,Occ),
    Testa \= Elem.


% Srivi predicato vero se data L1 e L2 la lista L3 è concatenazione di L1,L2
is_concat([], List, List).
is_concat([Head|Tail], List, [Head|Rest]) :-
    is_concat(Tail, List, Rest).

%is_concat2([], [], []).
is_concat2([], L2, L2).
%is_concat2(L1, [], L1).
is_concat2([H1|T1], L2, [H1|R]) :-
    is_concat2(T1, L2, R).

is_concat3(L3, L1, L2) :- append(L3, L1, L2).


% Rimuovere l'ultimo elemento
list_no_last(L1, [L1]).
list_no_last(L1, [H|T]) :- 
    list_no_last([H|L1], T).


% reverse della lista
my_reverse(L1,L2) :- my_rev(L1,L2,[]).
my_rev([],L2,L2) :- !.
my_rev([X|Xs],L2,Acc) :- my_rev(Xs,L2,[X|Acc]).


