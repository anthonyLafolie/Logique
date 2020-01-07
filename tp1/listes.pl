/*
  Anthony Lafolie
  Anthony Mendez
*/

/* Question 1 */
longueur([], 0).
longueur([_ | Y], L) :- longueur(Y, L2), L is L2 + 1.

/* Question 2 */
somme([], 0).
somme([E | Y], L) :- somme(Y, L2), L is L2 + E.

/* Question 3 */
membre(X, [X | _]).
membre(X, [_ | L]) :- membre(X, L).

/* Question 4 */
ajoute_en_tete(E, Y, [E|Y]).

/* Question 5 */
ajoute_en_queue(E, [], [E]) :- !.
ajoute_en_queue(E, [X | TL], [X | L]) :- ajoute_en_queue(E, TL, L).

/* Question 6 */
extraire_tete(Y, X, L) :- ajoute_en_tete(X, L, Y).
% extraire_tetev2([X|L], X, L).

/* Question 7 */
concatene([],L,L) :- !.
concatene([X | L1 ], L2, [X | L3]) :- concatene(L1,L2,L3).

/* Question 8 */
retourne([],L,L) :- !.
retourne([X | L1], L2, A) :- ajoute_en_tete(X, L2, L3), retourne(L1,L3,A).

/* Tris sur les listes */

/* Question 9 */
insert_trie(E, [], [E]) :- !.
insert_trie(E, [X | Y], L) :- E =< X, !, ajoute_en_tete(E, [X | Y], L) .
insert_trie(E, [X | Y], [X | XS]) :- E > X, !, insert_trie(E, Y, XS) .


/* Question 10 */
tri_insert([], []) :- !.
tri_insert([X | XS], L) :- tri_insert(XS, T), insert_trie(X, T, L).


/* Question 11 */
divise([], [], []) :- !.
divise([X], [X], []) :- !.
% divise([X | L], [X | L1], [X2 | L2]) :- extraire_tete(L, X2, Q), divise(Q, L1, L2).
divise([X | [X2 | Q]], [X | L1], [X2 | L2]) :- divise(Q, L1, L2).

/* Question 12 */
fusion([],L2,L2) :- !.
fusion(L1,[],L1) :- !.
fusion([X | XS], [Y | YS], [X | ZS]) :- X =< Y, !,  fusion(XS, [Y | YS], ZS).
fusion([X | XS], [Y | YS], [Y | ZS]) :- X > Y, !,  fusion([X | XS], YS, ZS).

/* Question 13 */
% tri_fusion([], []) :- !.
tri_fusion([X], [X]):- !.
tri_fusion(X, L) :- divise(X,L1,L2), tri_fusion(L1, TL1), tri_fusion(L2, TL2), fusion(TL1,TL2,L).

/* Question 14 */
% balance(_, [], [], []) :- !.
balance(E, [X], [X], []) :- X < E, !.
balance(E, [X], [], [X]) :- X >= E, !.
balance(E, [X | XS], [X | L1], L2) :- X < E, !, balance(E, XS, L1, L2).
balance(E, [X | XS], L1, [X | L2]) :- X >= E, !, balance(E, XS, L1, L2).

/* Question 15 */
tri_rapide([], []) :- !.
tri_rapide([X], [X]) :- !.
tri_rapide(X, L) :- extraire_tete(X, P, XS), balance(P, XS, L1, L2), tri_rapide(L1, LT1), tri_rapide(L2, LT2), concatene(LT1, [P], LT3), concatene(LT3, LT2, L).

/* Opérations de base sur les ensembles */

/* Question 16 */
est_vide([]).

/* Question 17 */
ajoute_emsemble(E, [], [E]).
ajoute_ensemble(X, L1, L2):- membre(X,L1), !,L1 = L2.
ajoute_ensemble(X, L1, L2) :- ajoute_en_queue(X,L1,L2).


/* Question 18 */
sous_ensemble([], _) :- !.
sous_ensemble([X|XS], L) :- membre(X, L), !, sous_ensemble(XS, L).

/* Question 19 */
union(L1, [], L1).
union(L1, [Y|YS], LS) :- ajoute_ensemble(Y, L1, LT), union(LT, YS, L3), tri_rapide(L3,LS).

/* Question 20 */
intersect([],_,[]) :- !.
intersect([X|XS],L2,[X|L]) :- membre(X,L2), !, intersect(XS,L2,L).
intersect([_|XS],L2,L) :- intersect(XS,L2,L).

/* Question 21 */
diff([],_,[]) :- ! .
diff([X|XS],L2,L) :- membre(X,L2), !, diff(XS,L2,L).
diff([X|XS], L2, [X|L]) :- diff(XS,L2,L).
