%Prolog Site Questions https://sites.google.com/site/prologsite/prolog-problems/1
my_last(X,[H|T]) :-
    T = [],
    X = H.
my_last(X,List) :-
    List = [_|T],
    my_last(X,T).
    
    
element_at(X, List, 1) :-
    List = [H|_],
    X = H.
element_at(X, List, Num) :-
    Num > 1,
    List = [_|T],
    NewNum is Num - 1,
    element_at(Y, T, NewNum),
    X = Y.
    
num_ele(List, Num) :-
    length(List, Num).
    
my_length([], 0).
my_length([_|T], Num) :-
    my_length(T,NewNum),
    Num is NewNum + 1.
    
palin(List) :-
    reverse(List,X),
    sublist(List,X).
    
    
my_flatten([],[]).
my_flatten([H|T], X) :-
    my_flatten(H, NewH),
    my_flatten(T, NewT),
    append(NewH, NewT, X).
my_flatten(X,[X]).

my_compress([],[]).
my_compress([X],[X]).
my_compress([H,H|T],X) :- my_compress([H|T],X).
my_compress([H,T|TS],[H|ZS]) :-
    H\=T,
    my_compress([T|TS],ZS).
    
