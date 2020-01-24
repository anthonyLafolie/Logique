/*
  Anthony Lafolie
  Anthony Mendez
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

grilleCross([[_,3,_,_,4,_,2,_,_],
             [_,_,_,9,_,_,_,6,_],
             [_,_,_,_,_,_,3,_,_],
             [_,5,_,_,_,7,_,8,_],
             [_,_,1,_,8,_,_,3,_],
             [_,7,3,_,_,9,_,_,_],
             [_,4,_,_,_,_,_,1,_],
             [_,_,_,6,_,_,_,_,_],
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

grillehex2([[7,_,_,0,_,_,14,6,_,_,_,15,_,_,12],
            [_,_,_,9,7,6,_,1,4,_,3,15,10,_,_,_],
            [_,_,_,_,_,_,_,11,9,_,_,_,_,_,_,_],
            [_,15,3,_,_,12,2,_,_,11,7,_,_,6,8,_],
            [5,12,15,_,_,10,11,4,0,3,1,_,_,14,6,2],
            [_,_,_,6,2,_,1,_,_,10,_,14,0,_,_,_],
            [3,9,11,1,0,_,14,7,2,4,_,6,12,10,15,8],
            [_,2,0,7,_,_,12,9,15,8,_,_,14,5,4,_],
            [6,_,14,_,_,_,3,15,10,1,_,_,_,11,_,7],
            [_,3,_,11,_,_,10,6,8,9,_,_,14,_,2,_],
            [0,_,1,15,14,11,_,_,_,_,6,2,9,8,_,14],
            [_,10,_,8,_,0,7,_,_,14,15,_,6,_,1,_],
            [8,_,9,_,_,_,_,10,11,_,_,_,_,15,_,4],
            [_,_,6,4,11,14,_,_,_,_,8,10,2,1,_,_],
            [14,5,_,_,15,7,_,_,_,_,14,3,_,_,9,10],
            [1,11,_,_,_,2,1,13,5,15,9,_,_,_,14,6]
           ]).

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


bonnelongueur([],0).
bonnelongueur([_|XS], T) :- bonnelongueur(XS,T2), T is T2 + 1.

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
solution(X):-bonnetaille(X,9),verifie(X),transp(X,Y),bonnetaille(X,9),verifie(Y), carres(X,Z), verifie(Z).


/* Question 11 */

diagonales([[X1,_,_,_,_,_,_,_,Y1],
            [_,X2,_,_,_,_,_,Y2,_],
            [_,_,X3,_,_,_,Y3,_,_],
            [_,_,_,X4,_,Y4,_,_,_],
            [_,_,_,_,XY5,_,_,_,_],
            [_,_,_,Y6,_,X6,_,_,_],
            [_,_,Y7,_,_,_,X7,_,_],
            [_,Y8,_,_,_,_,_,X8,_],
            [Y9,_,_,_,_,_,_,_,X9]],
            [[X1,X2,X3,X4,XY5,X6,X7,X8,X9],[Y1,Y2,Y3,Y4,XY5,Y6,Y7,Y8,Y9]]).

% diagonales([[1111,2,3,4,5,6,7,8,9999],[1,2222,3,4,5,6,7,8888,9],[1,2,3333,4,5,6,7777,8,9],[1,2,3,4444,5,6666,7,8,9],[1,2,3,4,5555,6,7,8,9],[1,2,3,4444,5,6666,7,8,9],[1,2,3333,4,5,6,7777,8,9],[1,2222,3,4,5,6,7,8888,9],[1111,2,3,4,5,6,7,8,9999]],L).

solutionCross(X):- solution(X), diagonales(X,D1),verifie(D1).


/* Question 12 */
verifie4([]).
verifie4([X|XS]) :- X ins 1..4, all_distinct(X),!, verifie4(XS).

decoupe4([], [], []).
decoupe4([Xa,Xb|XS], [Ya,Yb|YS],[[Xa,Xb,Ya,Yb]|L]):- decoupe4(XS,YS,L).

carres4([], []).
carres4([Xa,Xb|XS], L):- decoupe4(Xa,Xb,LT), carres4(XS,LTT), concatene(LT,LTT,L).

solution4(X):-bonnetaille(X,4),verifie4(X),transp(X,Y),bonnetaille(Y,4),verifie4(Y), carres4(X,Z), verifie4(Z).

/* Question 13 */
transform(0,0).
transform(1,1).
transform(2,2).
transform(3,3).
transform(4,4).
transform(5,5).
transform(6,6).
transform(7,7).
transform(8,8).
transform(9,9).
transform(a,10).
transform(b,11).
transform(c,12).
transform(d,13).
transform(e,14).
transform(f,15).

transformList([],[]).
transformList([X|XS],[Y|L]) :- transform(X,Y), transformList(XS,L).
% transformList([_|XS],L) :- transformList(XS,L), transform2().

verifie16([]).
verifie16([X|XS]) :- X ins 0..15, !, verifie16(XS).
% verifie16([X|XS]) :-  transformList(X,Y), Y ins 0..15, !, verifie16(XS).

decoupe16([], [], [], [],[]).
decoupe16([Wa,Wb,Wc,Wd|WS],[Xa,Xb,Xc,Xd|XS], [Ya,Yb,Yc,Yd|YS],[Za,Zb,Zc,Zd|ZS],[[Wa,Wb,Wc,Wd,Xa,Xb,Xc,Xd,Ya,Yb,Yc,Yd,Za,Zb,Zc,Zd]|L]):- decoupe16(WS,XS,YS,ZS,L).

carres16([], []).
carres16([Xa,Xb,Xc,Xd|XS], L):- decoupe16(Xa,Xb,Xc,Xd,LT), carres16(XS,LTT), concatene(LT,LTT,L).

solution16(X):-bonnetaille(X,16),verifie16(X),transp(X,Y),bonnetaille(Y,16),verifie16(Y), carres16(X,Z), verifie16(Z).
