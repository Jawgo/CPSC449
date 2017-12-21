%% Question 7 Pro final review
elementAt(List, 0, X) :-
    List = [Head | Tail],
    X = Head.
elementAt(List, Loc, X) :-
    Loc > 0,
    List = [Head | Tail],
    NewLoc is Loc -1,
    elementAt(Tail, NewLoc, Y),
    X=Y.
elementAt(List, Loc, X) :-
    Loc < 0,
    NewLoc is abs(Loc + 1),
    reverse(List, NewList),
    elementAt(NewList, NewLoc, X).
    