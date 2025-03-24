membro(A, [A|B]).
membro(A, [B|C]) :- 
    membro(A, C).

% Se A è la testa, restituisce true.
% Se A non è la testa, richiama membro(A, C),
% ripetendo il processo finché trova A o la lista diventa vuota.

%              membro(a, [1,2,a,66]).
%   Call: (12) membro(a, [1, 2, a, 66])
%   Call: (13) membro(a, [2, a, 66])
%   Call: (14) membro(a, [a, 66]) 
%   Exit: (14) membro(a, [a, 66]) 
%   Exit: (13) membro(a, [2, a, 66])
%   Exit: (12) membro(a, [1, 2, a, 66])