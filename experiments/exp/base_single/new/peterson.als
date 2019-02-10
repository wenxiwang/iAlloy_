module examples/algorithms/peterson
open util/integer [] as integer
open util/ordering [priority] as po
open util/ordering [State] as so
sig pid {}
sig priority {}
abstract sig label_t {}
one sig L0 extends label_t {}
one sig L1 extends label_t {}
one sig L2 extends label_t {}
one sig L3 extends label_t {}
one sig L4 extends label_t {}
sig State {
P: (pid->label_t),
Q: (pid->priority),
turn: (priority->pid),
localj: (pid->priority)
}
pred NOPTrans[i: pid,pre,post: State] {
(((i.(post.P)) = (i.(pre.P))) && ((i.(post.Q)) = (i.(pre.Q))) && ((i.(post.localj)) = (i.(pre.localj))))
}
pred L0TransPre[i: pid,pre: State] {
((i.(pre.P)) = L0)
}
pred L0Trans[i: pid,pre,post: State] {
((L0TransPre[i,pre]) && ((i.(post.localj)) = ((po/first[]).(po/next[]))) && ((i.(post.P)) = L1) && ((i.(post.Q)) = (i.(pre.Q))) && ((post.turn) = (pre.turn)))
}
pred L1TransPre[i: pid,pre: State] {
((i.(pre.P)) = L1)
}
pred L1Trans[i: pid,pre,post: State] {
((L1TransPre[i,pre]) && ((i.(post.localj)) = (i.(pre.localj))) && ((i.(post.Q)) = (i.(pre.localj))) && ((i.(post.P)) = L2) && ((post.turn) = (pre.turn)))
}
pred L2TransPre[i: pid,pre: State] {
((i.(pre.P)) = L2)
}
pred L2Trans[i: pid,pre,post: State] {
((L2TransPre[i,pre]) && ((i.(post.localj)) = (i.(pre.localj))) && ((i.(post.Q)) = (i.(pre.Q))) && ((i.(post.P)) = L3) && (((i.(post.localj)).(post.turn)) = i) && (all j: (one (priority - (i.(post.localj)))) {
((j.(post.turn)) = (j.(pre.turn)))
}))
}
pred L3TransPre[i: pid,pre: State] {
(((i.(pre.P)) = L3) && (all k: (one (pid - i)) {
((po/lt[(k.(pre.Q)),(i.(pre.localj))]) || (((i.(pre.localj)).(pre.turn)) != i))
}))
}
pred L3Trans[i: pid,pre,post: State] {
((L3TransPre[i,pre]) && ((i.(post.localj)) = ((i.(pre.localj)).(po/next[]))) && ((po/lt[(i.(post.localj)),(po/last[])]) => ((i.(post.P)) = L1) else ((i.(post.P)) = L4)) && ((i.(post.Q)) = (i.(pre.Q))) && ((post.turn) = (pre.turn)))
}
pred L4TransPre[i: pid,pre: State] {
((i.(pre.P)) = L4)
}
pred L4Trans[i: pid,pre,post: State] {
((L4TransPre[i,pre]) && ((i.(post.P)) = L0) && ((i.(post.Q)) = (po/first[])) && ((i.(post.localj)) = (i.(pre.localj))) && ((post.turn) = (pre.turn)))
}
pred RealTrans[i: pid,pre,post: State] {
((L0Trans[i,pre,post]) || (L1Trans[i,pre,post]) || (L2Trans[i,pre,post]) || (L3Trans[i,pre,post]) || (L4Trans[i,pre,post]))
}
pred SomePre[i: pid,pre: State] {
((L0TransPre[i,pre]) || (L1TransPre[i,pre]) || (L2TransPre[i,pre]) || (L3TransPre[i,pre]) || (L4TransPre[i,pre]))
}
pred TwoRun[] {
(some s1,s2: (one State),i1,i2: (one pid) {
((s1 != s2) && (i1 != i2) && ((i1.(s1.P)) = L4) && ((i2.(s2.P)) = L4))
})
}
pred ThreeRun[] {
(some disj s1,s2,s3: (one State),disj i1,i2,i3: (one pid) {
(((i1.(s1.P)) = L4) && ((i2.(s2.P)) = L4) && ((i3.(s3.P)) = L4))
})
}

fact fact_1 {
((#priority) = ((#pid) + 1))
}
fact Init {
(let firstState = (so/first[]) {
((all i: (one pid) {
(((i.(firstState.P)) = L0) && ((i.(firstState.Q)) = (po/first[])))
}) && (no (firstState.turn)) && (no (firstState.localj)))
})
}
fact LegalTrans {
(all pre: (one (State - (so/last[]))) {
(let post = (pre.(so/next[])) {
((all i: (one pid) {
((RealTrans[i,pre,post]) || (NOPTrans[i,pre,post]))
}) && ((all i: (one pid) {
(NOPTrans[i,pre,post])
}) => ((all i: (one pid) {
(!(SomePre[i,pre]))
}) && ((post.turn) = (pre.turn)))))
})
})
}
assert Safety {
(all i1,i2: (one pid),s: (one State) {
((i1 != i2) => (!(((i1.(s.P)) = L4) && ((i2.(s.P)) = L4))))
})
}
assert NotStuck {
(all pre: (one (State - (so/last[]))) {
(let post = (pre.(so/next[])) {
(some i: (one pid) {
((RealTrans[i,pre,post]) && (!(NOPTrans[i,pre,post])))
})
})
})
}
run NOPTrans for 16
run L0TransPre for 16
run L0Trans for 18
run L1TransPre for 16
run L1Trans for 18
run L2TransPre for 20
run L2Trans for 18
run L3TransPre for 16
run L3Trans for 17
run L4TransPre for 17
run L4Trans for 17
run RealTrans for 17
run SomePre for 17
run TwoRun for 19
run ThreeRun for 19
check Safety for 18
check NotStuck for 20