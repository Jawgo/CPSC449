/*
**  Q6
*/
canBeFriends(X, Y) :- 
  male(X), 
  male(Y), 
  X \= Y, 
  likes(X, Z), 
  likes(Y, Z), 
  \+female(Z).
canBeFriends(X, Y) :-
  female(X), 
  female(Y), 
  X \= Y, 
  likes(X, Z), 
  likes(Y, Z), 
  \+male(Z).
canBeFriends(X, Y) :-
  ((male(X), female(Y)) ; (female(X), male(Y))), 
  \+likes(X, Y), 
  \+likes(Y, X), 
  likes(X, Z), 
  likes(Y, Z).

/*
**  Q7
*/
elementAt([_ | T], Position, Result) :-
  Position > 0,
  PM1 is Position - 1,
  elementAt(T, PM1, Result).
elementAt([H | _], 0, H).
elementAt(Values, Position, Result) :-
  Position < -1,
  PP1 is Position + 1,
  append(AllButLast, [_], Values),
  elementAt(AllButLast, PP1, Result).
elementAt(Values, -1, Result) :-
  append(_, [X], Values),
  Result = X.

/*
**  Q8
*/
search(Values, Current, NoMatch) :-
  \+numberPuzzle(Values, Current, _), 
  NoMatch = Current.
search(Values, Current, NoMatch) :-
  numberPuzzle(Values, Current, _),
  !,
  Next is Current + 1,
  search(Values, Next, NoMatch).