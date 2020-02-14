Lemma hilbertS (A B C : Prop) :  (A -> B -> C) -> (A -> B) -> A -> C.
Proof.
intros abc ab a.
apply abc.
exact a.
apply ab.
exact a.
Qed.

Lemma q2 (A B : Prop) :  A -> (B -> A).
Proof.
intro a.
intro b.
exact a.
Qed.

Lemma q3 (A B : Prop) :  A -> (~A -> B).
Proof.
intro a.
intro b.
destruct b.
exact a.
Qed.

Lemma q4 (A B C : Prop) :  (A -> B) -> ((B -> C) -> (A -> C)).
Proof.
intro a.
intro b.
intro c.
apply b.
apply a.
exact c.
Qed.

Lemma q5 (A B : Prop) :  (A -> B) -> (~B -> ~A).
Proof.
intro a.
intro b.
intro c.
destruct b.
apply a.
exact c.
Qed.

Require Import Classical.

Lemma tiersexclus (A : Prop) : A \/ ~A.
Proof.
apply NNPP.
intro a.
apply a.
right.
apply NNPP.
intro b.
apply a.
left.
apply NNPP.
exact b.
Qed.


Lemma bottom_c (A : Prop) : (~A -> False) -> A.
Proof.
apply NNPP.
Qed.

Lemma q8 (A B : Prop) : (~B -> ~A) -> (A -> B).
Proof.
intro a.
intro b.
apply NNPP.
intro c.
destruct a.
exact c.
exact b.
Qed.

Lemma q9 (A : Prop) : ~~A <-> A.
Proof.
split.
+ intro a.
  apply NNPP.
  exact a.
+ intro a.
  intro b.
  destruct b.
  exact a.
Qed.

Lemma q10 (A : Prop) :  (A /\ ~A) <-> False.
Proof.
split.
+ intro a.
  destruct a.
  destruct H0.
  exact H.
+ intro a.
  split.
  apply NNPP.
  intro b.
  apply a.
  destruct a.
Qed.

Lemma q11 (A B : Prop) :  (A \/ B) <-> ~(~A /\ ~B).
Proof.
split.
+ intro a.
  apply NNPP.
  intro b.
  apply b.
  intro c.
  apply b.
  destruct c.
  intro c.
  destruct a.
  apply H.
  exact H1.
  apply H0.
  exact H1.
+ intro a.
  apply NNPP.
  intro b.
  apply b.
  left.
  apply NNPP.
  intro c.
  apply b.
  right.
  apply NNPP.
  intro d.
  apply a.
  split.
  apply c.
  apply d.
Qed.

Lemma q12 (A : Prop) :  ~A <-> (A -> False).
Proof.
split.
+ intro a.
  apply a.
+ intro a.
  intro b.
  apply a.
  exact b.
Qed.

Lemma q13 (A B : Prop) :  (A <-> B) <-> (A -> B) /\ (B -> A).
Proof.
split.
+ intro a.
  split.
  - intro b.
    apply a.
    exact b.
  - intro b.
    apply a.
    exact b.
+ intro b.
  split.
  - intro a.
    destruct b.
    apply H.
    exact a.
  - intro a.
    destruct b.
    apply H0.
    exact a.
Qed.

Lemma q14 (A B C : Prop) :  (A /\ B -> C) <-> (A -> B -> C).
Proof.
split.
+ intro a.
  intro b.
  intro c.
  apply a.
  split.
  exact b.
  exact c.
+ intro a.
  intro b.
  apply a.
  apply b.
  apply b.
Qed.
 
Lemma q15 (A B C : Prop) :  (C -> A)\/ (C -> B) <-> (C -> A \/ B).
Proof.
split.
+ intro a.
  destruct a.
  intro c.
  left.
  apply H.
  exact c.
  right.
  apply H.
  exact H0.
+ intro a.
  apply NNPP.
  intro b.
  apply b.
  left.
  intro c.
  destruct a.
  exact c.
  exact H.
  apply bottom_c.
  intro d.
  apply b.
  right.
  intro e.
  exact H.
Qed.

Lemma q16 (X : Type) (A B : X -> Prop) : ((forall x, A x) \/ (forall x, B x)) -> forall x, A x \/ B x.
Proof.
intro a.
intro b.
destruct a.
left.
apply H.
right.
apply H.
Qed.

Lemma q17 (X : Type) (A B : X -> Prop) : (exists x, A x /\ B x) -> ((exists x, A x) /\ (exists x, B x)).
Proof.
intro a.
destruct a.
split.
+ exists x.
  apply H.
+ exists x.
  apply H. 
Qed.


Lemma q18 (A B : Prop) : ~ (A /\ B) -> (~ A \/ ~ B).
Proof.
intro a.
apply NNPP.
intro b.
apply b.
left.
intro c.
destruct a.
split.
apply c.
apply bottom_c.
intro d.
apply b.
right.
exact d.
Qed.

Lemma q19 (X : Type) : forall (x1 x2 : X), x1 = x2 -> x2 = x1.
Proof.
intro a.
intro b.
intro c.
rewrite c.
reflexivity.
Qed.

Lemma q20 (X : Type) : forall (x1 x2 x3 : X), x1 = x2 /\ x2 = x3 -> x1 = x3.
Proof.
intro a.
intro b.
intro c.
intro d.
destruct d.
rewrite H.
exact H0.
Qed.

