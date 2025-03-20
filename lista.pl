membro(A,[A|B]).
membro(A,[B,C]) :- 
    membro(A,C).