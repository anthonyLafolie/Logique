/*
  Prénom1 Nom1
  Prénom2 Nom2
*/

grille([[_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,3,_,8,5],
        [_,_,1,_,2,_,_,_,_],
        [_,_,_,5,_,7,_,_,_],
        [_,_,4,_,_,_,1,_,_],
        [_,9,_,_,_,_,_,_,_],
        [5,_,_,_,_,_,_,7,3],
        [_,_,2,_,1,_,_,_,_],
        [_,_,_,_,4,_,_,_,9]]).

grilleCross([[_,3,_,8,4,_,2,_,_],
             [_,_,_,9,_,_,_,6,_],
             [_,_,5,_,2,_,3,_,_],
             [2,5,_,_,_,7,4,8,_],
             [_,_,1,_,8,_,_,3,_],
             [_,7,3,_,_,9,_,_,1],
             [_,4,_,_,9,_,_,1,_],
             [_,_,8,6,_,_,9,_,_],
             [9,_,_,2,_,4,_,_,_]]).

grille4([[2,_,_,3],
         [_,_,2,_],
         [_,4,1,_],
         [1,_,_,_]]).

grillehex([[b,2,_,7,_,_,_,f,6,e,_,_,_,3,_,d],
           [_,_,_,9,b,_,2,_,_,_,_,_,f,1,_,6],
      	   [_,a,_,c,_,_,7,_,4,_,8,_,_,_,e,_],
           [_,8,_,3,_,_,1,_,_,_,f,c,a,_,4,2],
           [_,_,e,_,_,_,_,_,1,6,a,_,_,_,3,_],
           [3,_,_,_,_,_,_,_,_,4,_,f,8,_,6,b],
           [_,_,_,d,2,_,_,_,_,b,_,_,7,4,_,_],
           [_,b,8,4,0,_,_,d,7,_,9,3,e,_,_,_],
           [_,_,_,f,3,7,_,4,5,_,_,9,0,d,c,_],
           [_,_,c,8,_,_,a,_,_,_,_,b,4,_,_,_],
           [4,9,_,5,e,_,d,_,_,_,_,_,_,_,_,a],
           [_,d,_,_,_,6,c,1,_,_,_,_,_,7,_,_],
           [9,1,_,e,7,4,_,_,_,f,_,_,3,_,d,_],
           [_,3,_,_,_,9,_,2,_,1,_,_,5,_,0,_],
           [f,_,4,b,_,_,_,_,_,3,_,d,1,_,_,_],
				   [5,_,d,_,_,_,f,e,9,_,_,_,2,_,b,4]]).

% grille([[9,8,_,6,_,_,_,3,1],
%         [_,_,7,_,_,_,_,_,_],
%         [6,_,_,5,4,_,_,_,_],
%         [_,_,_,_,_,8,3,7,4],
%         [_,_,_,_,6,_,_,_,_],
%         [_,_,_,_,_,_,9,_,2],
%         [_,3,2,_,_,7,4,_,_],
%         [_,4,_,3,_,_,_,1,_],
%         [_,_,_,_,_,_,_,_,_]]).
/* Question 1 */
printline([]):- writeln('|').
printline([X|XS]) :- integer(X), !, write('|'), write(X), printline(XS).
printline([_|XS]) :- write('| '), printline(XS).

/* Question 2 */
print([]):- writeln('').
print([X|XS]) :- printline(X), print(XS).

/* Question 3 */

longueur([], 0).
longueur([_ | Y], L) :- longueur(Y, L2), L is L2 + 1.

bonnelongueur([],0).
bonnelongueur(L, T) :- longueur(L,T2), T is T2.

/* Question 4 */
bonnetaille([], _).
bonnetaille([X|XS], T):- bonnelongueur(X,T), !, bonnetaille(XS, T).

?- use_module(library(clpfd)).

/* Question 5 */
verifie([]).
verifie([X|XS]) :- X ins 1..9, all_distinct(X),!, verifie(XS).

/* Question 6 */
eclate([],[],[]).
eclate([X|XS], [], [[X]|L]) :- eclate(XS,[],L), !.
eclate([X|XS], [Y|YS], [[X|Y]|L]) :- eclate(XS,YS,L).

/* Question 7 */
transp([],[]).
transp([X|XS], L) :- transp(XS,LT), eclate(X,LT,L).

/* Question 8 */
decoupe([], [], [], []).
decoupe([Xa,Xb,Xc|XS], [Ya,Yb,Yc|YS], [Za,Zb,Zc|ZS],[[Xa,Xb,Xc,Ya,Yb,Yc,Za,Zb,Zc]|L]):- decoupe(XS,YS,ZS,L).

/* Question 9 */

concatene([],L,L) :- !.
concatene([X | L1 ], L2, [X | L3]) :- concatene(L1,L2,L3).

carres([], []).
carres([Xa,Xb,Xc|XS], L):- decoupe(Xa,Xb,Xc,LT), carres(XS,LTT), concatene(LT,LTT,L).

/* Question 10 */
% Toutes les lignes sont de longueur 9. -> verifie(X)
% Toutes les colonnes sont de longueur 9. -> transp(X,Y), verifie(Y)
% Chaque ligne contient des valeurs de 1 à 9 différentes. -> deja verifié
% Chaque colonne contient des valeurs de 1 à 9 différentes. -> deja verifié
% Chaque carré contient des valeurs de 1 à 9 différentes. -> carres(X,Z), verifie(Z)

solution(X):-bonnetaille(X,9),verifie(X),transp(X,Y),bonnetaille(X,9),verifie(Y), carres(X,Z), verifie(Z).


/* Question 11 */
diagonale([[X1|_],[_,X2|_],[_,_,X3|_],[_,_,_,X4|_],[_,_,_,_,X5|_],
[_,_,_,_,_,X6|_],[_,_,_,_,_,_,X7|_],[_,_,_,_,_,_,_,X8|_], [_,_,_,_,_,_,_,_,X9]], [X1,X2,X3,X4,X5,X6,X7,X8,X9]).
% diagonale([[1111,2,3,4,5,6,7,8,9],[1,2222,3,4,5,6,7,8,9],[1,2,3333,4,5,6,7,8,9],[1,2,3,4444,5,6,7,8,9],[1,2,3,4,5555,6,7,8,9],[1,2,3,4,5,6666,7,8,9],[1,2,3,4,5,6,7777,8,9],[1,2,3,4,5,6,7,8888,9],[1,2,3,4,5,6,7,8,9999]],L).

solutionCross(X):- solution(X), diagonale(X,D1), transp(X,Y), diagonale(Y,D2), verifie([D1,D2]).


/* Question 12 */
verifie4([]).
verifie4([X|XS]) :- X ins 1..4, all_distinct(X),!, verifie4(XS).

decoupe4([], [], []).
decoupe4([Xa,Xb|XS], [Ya,Yb|YS],[[Xa,Xb,Ya,Yb]|L]):- decoupe4(XS,YS,L).

carres4([], []).
carres4([Xa,Xb|XS], L):- decoupe4(Xa,Xb,LT), carres4(XS,LTT), concatene(LT,LTT,L).

solution4(X):-bonnetaille(X,4),verifie4(X),transp(X,Y),bonnetaille(X,4),verifie4(Y), carres4(X,Z), verifie4(Z).

/* Question 13 */
?- use_module(library(crypto)).
verifie16([]).
verifie16([X|XS]) :- format('~d', X) ins 1..15, all_distinct(X),!, verifie16(XS).
%
% decoupe4([], [], []).
% decoupe4([Xa,Xb|XS], [Ya,Yb|YS],[[Xa,Xb,Ya,Yb]|L]):- decoupe4(XS,YS,L).
%
% carres4([], []).
% carres4([Xa,Xb|XS], L):- decoupe4(Xa,Xb,LT), carres4(XS,LTT), concatene(LT,LTT,L).
%
% solution4(X):-bonnetaille(X,4),verifie4(X),transp(X,Y),bonnetaille(X,4),verifie4(Y), carres4(X,Z), verifie4(Z).
