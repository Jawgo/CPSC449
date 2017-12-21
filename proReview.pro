%% Final prolog review

male(bob).
male(charles).
male(evan).
male(gordon).
female(alice).
female(diane).
female(fiona).
female(harriot).

likes(bob, pizza).
likes(evan, pizza).
likes(charles, alice).
likes(evan, fiona).
likes(gordon, fiona).
likes(fiona, charles).
likes(fiona, evan).
likes(charles, golf).
likes(evan, golf).
likes(gordon, golf).
likes(alice, shopping).
likes(diane, shopping).
likes(diane, bob).
likes(fiona, golf).
likes(harriot, golf).
likes(diane, steak).
likes(fiona, steak).

canBeFriends(Male1, Male2) :-
    male(Male1),
    male(Male2),
    Male1 \= Male2,
    likes(Male1, X),
    likes(Male2, X),
    \+ female(X).
canBeFriends(F1, F2) :-
    female(F1),
    female(F2),
    F2 \= F1,
    likes(F1, X),
    likes(F2, X),
    \+ male(X).
canBeFriends(X,Y) :-
    (male(X), female(Y));(male(Y), female(X)),
    \+ likes(X, Y),
    \+ likes(Y, X),
    likes(X, Z),
    likes(Y, Z).