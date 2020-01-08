/*
  Prénom1 Nom1
  Prénom2 Nom2
*/

% ['../tp1/listes',sudoku].
% grille([[_,_,_,_,_,_,_,_,_],
%         [_,_,_,_,_,3,_,8,5],
%         [_,_,1,_,2,_,_,_,_],
%         [_,_,_,5,_,7,_,_,_],
%         [_,_,4,_,_,_,1,_,_],
%         [_,9,_,_,_,_,_,_,_],
%         [5,_,_,_,_,_,_,7,3],
%         [_,_,2,_,1,_,_,_,_],
%         [_,_,_,_,4,_,_,_,9]]).
grille([[9,8,_,6,_,_,_,3,1],
        [_,_,7,_,_,_,_,_,_],
        [6,_,_,5,4,_,_,_,_],
        [_,_,_,_,_,8,3,7,4],
        [_,_,_,_,6,_,_,_,_],
        [_,_,_,_,_,_,9,_,2],
        [_,3,2,_,_,7,4,_,_],
        [_,4,_,3,_,_,_,1,_],
        [_,_,_,_,_,_,_,_,_]]).

/* Question 1 */
printline([]):- writeln('|').
printline([X|XS]) :- integer(X), !, write('|'), write(X), printline(XS).
printline([_|XS]) :- write('| '), printline(XS).

/* Question 2 */
print([]):- writeln('').
print([X|XS]) :- printline(X), print(XS).

/* Question 3 */
bonnelongueur(L, T) :- longueur(L,T2), T is T2.

/* Question 4 */
bonnetaille([], 0).
bonnetaille([X|XS], T):- longueur(X, T2), T is T2, !, bonnetaille(XS, T).

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
carres([], []).
carres([Xa,Xb,Xc|XS], [Ya,Yb,Yc|L]):- decoupe(Xa,Xb,Xc,[Ya,Yb,Yc]), carres(XS,L).

/* Question 10 */
% Toutes les lignes sont de longueur 9. -> verifie(X)
% Toutes les colonnes sont de longueur 9. -> transp(X,Y), verifie(Y)
% Chaque ligne contient des valeurs de 1 à 9 différentes. -> deja verifié
% Chaque colonne contient des valeurs de 1 à 9 différentes. -> deja verifié
% Chaque carré contient des valeurs de 1 à 9 différentes. -> carres(X,Z), verifie(Z)

solution(X):-verifie(X),transp(X,Y), verifie(Y), carres(X,Z), verifie(Z).




/* Question 11 */
% diago([],[],_).
% diago([[X|XS]|[Y|XSS]], [X|L],) :-

dA(X,[H|R],[A|Z]):-                     % [A|Z] is the diagonal of [H|R]
    nth0(X,H,A),
    Y is X+1,
    (R=[],Z=R;dA(Y,R,Z)).
