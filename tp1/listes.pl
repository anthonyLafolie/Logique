/*
  Prénom1 Nom1
  Prénom2 Nom2
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
extraire_tetev2([X|L], X, L).

/* Question 7 */
concatene([],L,L).
concatene([X | L1 ], L2, [X | L3]) :- concatene(L1,L2,L3).

/* Question 8 */
retourne([],L,L).
retourne([X | L1], L2, A) :- ajoute_en_tete(X, L2, L3), retourne(L1,L3,A).

/* Tris sur les listes */

/* Question 9 */

insert_trie(E, [X | Y], L) :- E =< X, !, ajoute_en_tete(E, [X | Y], L) .
insert_trie(E, [X | Y], [X | XS]) :- E > X, !, insert_trie(E, Y, XS) .
insert_trie(E, [], [E]).
/* Question 10 */

/* Question 11 */

/* Question 12 */

/* Question 13 */

/* Question 14 */

/* Question 15 */

/* Opérations de base sur les ensembles */

/* Question 16 */

/* Question 17 */

/* Question 18 */

/* Question 19 */

/* Question 20 */

/* Question 21 */
