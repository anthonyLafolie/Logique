Definition faux := forall (P : Prop), P.
Definition non (A : Prop) := forall (P : Prop), ((A -> faux) -> P) -> P.
Definition et (A B : Prop) := forall (P : Prop), (A -> B -> P) -> P.
Definition ou (A B : Prop) := forall (P : Prop), ((A -> P) -> (B -> P) -> P).
Definition existe (A : Type) (P : A -> Prop) := forall (Q : Prop), (forall a, P a -> Q) -> Q.
Definition egal (A : Type) (a a' : A) := forall (P : A -> Prop), P a -> P a'.

Lemma bottom_e (A : Prop) : faux -> A.
Proof.
intro a.
apply a.
Qed.

Lemma non_intro (A : Prop) : (A -> faux) -> non A.
Proof.
intro a.
intro b.
intro c.
apply c.
apply a.
Qed.

Lemma non_elim (A : Prop) : A -> non A -> faux.
Proof.
intro a.
intro b.
apply b.
intro c.
apply c.
apply a.
Qed.

Lemma et_intro (A B : Prop) : A -> B -> et A B.
Proof.
intro a.
intro b.
intro c.
intro d.
apply d.
exact a.
apply b.
Qed.



Lemma et_elim_g (A B : Prop) : et A B -> A.
Proof.
intro a.
apply a.
intro b.
intro c.
apply b.
Qed.

Lemma et_elim_d (A B : Prop) : et A B -> B.
Proof.
intro a.
apply a.
intro b.
intro c.
exact c.
Qed.

Lemma ou_intro_g (A B : Prop) : A -> ou A B.
Proof.
intro a.
intro b.
intro c.
intro d.
apply c.
exact a.
Qed.

Lemma ou_intro_d (A B : Prop) : B -> ou A B.
Proof.
intro a.
intro b.
intro c.
intro d.
apply d.
exact a.
Qed.

Lemma ou_elim (A B C : Prop) : ou A B -> (A -> C) -> (B -> C) -> C.
Proof.
intro a.
apply a.
Qed.


Lemma existe_intro (A : Type) (P : A -> Prop) : forall x : A, P x -> existe A P.
Proof.
intro a.
intro b.
intro c.
intro d.
apply (d a).
exact b.
Qed.

Lemma existe_elim (A : Type) (P : A -> Prop) (Q : Prop) : existe A P -> (forall x : A, P x -> Q) -> Q.
Proof.
intro a.
apply a.
Qed.

Lemma faux_false : faux <-> False.
Proof.
split.
+ intro a.
  apply a.
+ intro b.
  destruct b.
Qed.

Lemma non_not (A : Prop) : non A <-> ~A.
Proof.
split.
+ intro a.
  intro b.
  apply a.
  intro c.
  apply c.
  exact b.
+ intro a.
  intro b.
  intro c.
  apply c.
  intro d.
  destruct a.
  exact d.
Qed.

Lemma et_and (A B : Prop) : et A B <-> A /\ B.
Proof.
split.
+ intro a.
  split.
  - apply a.
    intro b.
    intro c.
    apply b.
  - apply a.
    intro b.
    intro c.
    apply c.
+ intro b.
  intro c.
  intro d.
  apply d.
  apply b.
  apply b.
Qed.

Lemma ou_or (A B : Prop) : ou A B <-> A \/ B.
Proof.
split.
+ intro a.
  apply a.
  - intro b.
    left.
    exact b.
  - intro b.
    right.
    exact b.
+ intro b.
  intro c.
  intro d.
  intro e.
  destruct b.
  apply d.
  exact H.
  apply e.
  exact H.
Qed.


Lemma existe_exists (A : Type) (P : A -> Prop) : existe A P <-> exists a, P a.
Proof.
split.
+ intro a.
  apply a.
  intro b.
  intro c.
  exists b.
  exact c.
+ intro a.
  destruct a.
  intro b.
  intro c.
  apply (c x).
  exact H.
Qed.

Lemma egal_eq (A : Type) (a a' : A) : egal _ a a' <-> a = a'.
Proof.
split.
+ intro b.
  apply b.
  reflexivity.
+ intro b.
  intro c.
  intro d.
  destruct b.
  exact d.
Qed.
