% question1
contenu(tigre).
contenu(princesse).

%%%%%%%%%%%%%%%%%%%%%%%% première salle

% question2
pancarte1_1(tigre, _).
pancarte1_1(_, princesse).
pancarte1_2(princesse, _).

% question3
salle1(X,Y) :- contenu(X), contenu(Y), pancarte1_1(X,Y), pancarte1_2(X,Y).
salle1(X,Y) :- contenu(X), contenu(Y), not(pancarte1_1(X,Y)), not(pancarte1_2(X,Y)).

% question4
/*
  ?- salle1(X, Y).
    X = Y, Y = princesse.
*/
affiche1(X,Y) :- salle1(X,Y),
  write('Porte numero 1 : '),
  write(X),
  nl,
  write('Porte numero 2 : '),
  write(Y),
  nl.

% question5
/*
?- trace, salle1(X,Y).
   Call: (9) salle1(_2446, _2448) ? creep
   Call: (10) contenu(_2446) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) contenu(_2448) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) pancarte1_1(tigre, tigre) ? creep
   Exit: (10) pancarte1_1(tigre, tigre) ? creep
   Call: (10) pancarte1_2(tigre, tigre) ? creep
   Fail: (10) pancarte1_2(tigre, tigre) ? creep
   Redo: (10) pancarte1_1(tigre, tigre) ? creep
   Fail: (10) pancarte1_1(tigre, tigre) ? creep
   Redo: (10) contenu(_2448) ? creep
   Exit: (10) contenu(princesse) ? creep
   Call: (10) pancarte1_1(tigre, princesse) ? creep
   Exit: (10) pancarte1_1(tigre, princesse) ? creep
   Call: (10) pancarte1_2(tigre, princesse) ? creep
   Fail: (10) pancarte1_2(tigre, princesse) ? creep
   Redo: (10) pancarte1_1(tigre, princesse) ? creep
   Exit: (10) pancarte1_1(tigre, princesse) ? creep
   Call: (10) pancarte1_2(tigre, princesse) ? creep
   Fail: (10) pancarte1_2(tigre, princesse) ? creep
   Redo: (10) contenu(_2446) ? creep
   Exit: (10) contenu(princesse) ? creep
   Call: (10) contenu(_2448) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) pancarte1_1(princesse, tigre) ? creep
   Fail: (10) pancarte1_1(princesse, tigre) ? creep
   Redo: (10) contenu(_2448) ? creep
   Exit: (10) contenu(princesse) ? creep
   Call: (10) pancarte1_1(princesse, princesse) ? creep
   Exit: (10) pancarte1_1(princesse, princesse) ? creep
   Call: (10) pancarte1_2(princesse, princesse) ? creep
   Exit: (10) pancarte1_2(princesse, princesse) ? creep
   Exit: (9) salle1(princesse, princesse) ? creep
X = Y, Y = princesse .
*/


%%%%%%%%%%%%%%%%%%%%%%%% deuxième salle

% question6
pancarte2_1(princesse, tigre).
pancarte2_2(princesse, tigre).
pancarte2_2(tigre, princesse).

salle2(X,Y) :- contenu(X), contenu(Y), pancarte2_1(X,Y),  not(pancarte2_2(X,Y)).
salle2(X,Y) :- contenu(X), contenu(Y), not(pancarte2_1(X,Y)),pancarte2_2(X,Y).



% question7
/*
  ?- salle2(X,Y).
    X = tigre,
    Y = princesse .
*/

% question8
/*
  ?- trace, salle2(X,Y).
   Call: (9) salle2(_2724, _2726) ? creep
   Call: (10) contenu(_2724) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) contenu(_2726) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) pancarte2_1(tigre, tigre) ? creep
   Fail: (10) pancarte2_1(tigre, tigre) ? creep
   Redo: (10) contenu(_2726) ? creep
   Exit: (10) contenu(princesse) ? creep
   Call: (10) pancarte2_1(tigre, princesse) ? creep
   Fail: (10) pancarte2_1(tigre, princesse) ? creep
   Redo: (10) contenu(_2724) ? creep
   Exit: (10) contenu(princesse) ? creep
   Call: (10) contenu(_2726) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) pancarte2_1(princesse, tigre) ? creep
   Exit: (10) pancarte2_1(princesse, tigre) ? creep
  ^  Call: (10) not(pancarte2_2(princesse, tigre)) ? creep
   Call: (11) pancarte2_2(princesse, tigre) ? creep
   Exit: (11) pancarte2_2(princesse, tigre) ? creep
  ^  Fail: (10) not(user:pancarte2_2(princesse, tigre)) ? creep
   Redo: (10) contenu(_2726) ? creep
   Exit: (10) contenu(princesse) ? creep
   Call: (10) pancarte2_1(princesse, princesse) ? creep
   Fail: (10) pancarte2_1(princesse, princesse) ? creep
   Redo: (9) salle2(_2724, _2726) ? creep
   Call: (10) contenu(_2724) ? creep
   Exit: (10) contenu(tigre) ? creep
   Call: (10) contenu(_2726) ? creep
   Exit: (10) contenu(tigre) ? creep
  ^  Call: (10) not(pancarte2_1(tigre, tigre)) ? creep
   Call: (11) pancarte2_1(tigre, tigre) ? creep
   Fail: (11) pancarte2_1(tigre, tigre) ? creep
  ^  Exit: (10) not(user:pancarte2_1(tigre, tigre)) ? creep
   Call: (10) pancarte2_2(tigre, tigre) ? creep
   Fail: (10) pancarte2_2(tigre, tigre) ? creep
   Redo: (10) contenu(_2726) ? creep
   Exit: (10) contenu(princesse) ? creep
  ^  Call: (10) not(pancarte2_1(tigre, princesse)) ? creep
   Call: (11) pancarte2_1(tigre, princesse) ? creep
   Fail: (11) pancarte2_1(tigre, princesse) ? creep
  ^  Exit: (10) not(user:pancarte2_1(tigre, princesse)) ? creep
   Call: (10) pancarte2_2(tigre, princesse) ? creep
   Exit: (10) pancarte2_2(tigre, princesse) ? creep
   Exit: (9) salle2(tigre, princesse) ? creep
  X = tigre,
  Y = princesse .
*/

% question9
/* c'est la pancarte 2 qui disait la vérité */

% Question10
affiche2(X,Y) :- salle2(X,Y),
  write('Porte numero 1 : '),
  write(X),
  nl,
  write('Porte numero 2 : '),
  write(Y),
  nl.

%%%%%%%%%%%%%%%%%%%%%%%% troisième salle

% question11
contenu2(tigre).
contenu2(princesse).
contenu2(vide).

pancarte3_1(princesse, tigre, vide).
pancarte3_1(tigre, princesse, vide).

pancarte3_2(tigre, princesse, vide).
pancarte3_2(tigre, vide, princesse).

pancarte3_3(princesse, tigre, vide).
pancarte3_3(tigre, princesse, vide).

porte1(P1,P2,P3) :- pancarte3_1(P1, P2, P3), pancarte3_3(P1, P2, P3), not(pancarte3_2(P1, P2, P3)).
porte2(P1,P2,P3) :- pancarte3_2(P1, P2, P3), not(pancarte3_1(P1, P2, P3)), not(pancarte3_3(P1, P2, P3)).
porte3(P1,P2,P3) :- pancarte3_3(P1, P2, P3), pancarte3_1(P1, P2, P3), not(pancarte3_2(P1, P2, P3)).

% question12
salle3(P1, P2, P3) :- not(porte1(P1, P2, P3)), porte2(P1, P2, P3), not(porte3(P1, P2, P3)).
salle3(P1, P2, P3) :- porte1(P1, P2, P3), not(porte2(P1, P2, P3)), porte3(P1, P2, P3).

% question13
affiche3(X,Y,Z) :- salle3(X,Y,Z),
  write('Porte numero 1 : '),
  write(X),
  nl,
  write('Porte numero 2 : '),
  write(Y),
  nl,
  write('Porte numero 3 : '),
  write(Z),
  nl.


% question14
/*
  ?- trace, salle3(X,Y,Z).
     Call: (9) salle3(_2668, _2670, _2672) ? creep
  ^  Call: (10) not(porte1(_2668, _2670, _2672)) ? creep
     Call: (11) porte1(_2668, _2670, _2672) ? creep
     Call: (12) pancarte3_1(_2668, _2670, _2672) ? creep
     Exit: (12) pancarte3_1(princesse, tigre, vide) ? creep
     Call: (12) pancarte3_3(princesse, tigre, vide) ? creep
     Exit: (12) pancarte3_3(princesse, tigre, vide) ? creep
  ^  Call: (12) not(pancarte3_2(princesse, tigre, vide)) ? creep
     Call: (13) pancarte3_2(princesse, tigre, vide) ? creep
     Fail: (13) pancarte3_2(princesse, tigre, vide) ? creep
  ^  Exit: (12) not(user:pancarte3_2(princesse, tigre, vide)) ? creep
     Exit: (11) porte1(princesse, tigre, vide) ? creep
  ^  Fail: (10) not(user:porte1(_2668, _2670, _2672)) ? creep
     Redo: (9) salle3(_2668, _2670, _2672) ? creep
     Call: (10) porte1(_2668, _2670, _2672) ? creep
     Call: (11) pancarte3_1(_2668, _2670, _2672) ? creep
     Exit: (11) pancarte3_1(princesse, tigre, vide) ? creep
     Call: (11) pancarte3_3(princesse, tigre, vide) ? creep
     Exit: (11) pancarte3_3(princesse, tigre, vide) ? creep
  ^  Call: (11) not(pancarte3_2(princesse, tigre, vide)) ? creep
     Call: (12) pancarte3_2(princesse, tigre, vide) ? creep
     Fail: (12) pancarte3_2(princesse, tigre, vide) ? creep
  ^  Exit: (11) not(user:pancarte3_2(princesse, tigre, vide)) ? creep
     Exit: (10) porte1(princesse, tigre, vide) ? creep
  ^  Call: (10) not(porte2(princesse, tigre, vide)) ? creep
     Call: (11) porte2(princesse, tigre, vide) ? creep
     Call: (12) pancarte3_2(princesse, tigre, vide) ? creep
     Fail: (12) pancarte3_2(princesse, tigre, vide) ? creep
     Fail: (11) porte2(princesse, tigre, vide) ? creep
  ^  Exit: (10) not(user:porte2(princesse, tigre, vide)) ? creep
     Call: (10) porte3(princesse, tigre, vide) ? creep
     Call: (11) pancarte3_3(princesse, tigre, vide) ? creep
     Exit: (11) pancarte3_3(princesse, tigre, vide) ? creep
     Call: (11) pancarte3_1(princesse, tigre, vide) ? creep
     Exit: (11) pancarte3_1(princesse, tigre, vide) ? creep
  ^  Call: (11) not(pancarte3_2(princesse, tigre, vide)) ? creep
     Call: (12) pancarte3_2(princesse, tigre, vide) ? creep
     Fail: (12) pancarte3_2(princesse, tigre, vide) ? creep
  ^  Exit: (11) not(user:pancarte3_2(princesse, tigre, vide)) ? creep
     Exit: (10) porte3(princesse, tigre, vide) ? creep
     Exit: (9) salle3(princesse, tigre, vide) ? creep
  X = princesse,
  Y = tigre,
  Z = vide ;
     Redo: (11) pancarte3_1(_2668, _2670, _2672) ? creep
     Exit: (11) pancarte3_1(tigre, princesse, vide) ? creep
     Call: (11) pancarte3_3(tigre, princesse, vide) ? creep
     Exit: (11) pancarte3_3(tigre, princesse, vide) ? creep
  ^  Call: (11) not(pancarte3_2(tigre, princesse, vide)) ? creep
     Call: (12) pancarte3_2(tigre, princesse, vide) ? creep
     Exit: (12) pancarte3_2(tigre, princesse, vide) ? creep
  ^  Fail: (11) not(user:pancarte3_2(tigre, princesse, vide)) ? creep
     Fail: (10) porte1(_2668, _2670, _2672) ? creep
     Fail: (9) salle3(_2668, _2670, _2672) ? creep
  false.
*/
