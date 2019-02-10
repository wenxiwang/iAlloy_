module examples/tutorial/farmer
open util/integer [] as integer
open util/ordering [State] as ord
abstract sig Object {
eats: (set Object)
}
one sig Farmer extends Object {}
one sig Fox extends Object {}
sig Chicken extends Object {}
one sig Grain extends Object {}
sig State {
near: (set Object),
far: (set Object)
}
pred crossRiver[from,from',to,to': (set Object)] {
(((from' = ((from - Farmer) - (from'.eats))) && (to' = (to + Farmer))) || (one x: (one (from - Farmer)) {
((from' = (((from - Farmer) - x) - (from'.(~eats)))) && (to' = ((to + Farmer) + x)))
}))
}
pred solvePuzzle[] {
(((ord/last[]).far) = Object)
}

fact eating {
(eats = ((Fox->Chicken) + (Chicken->Grain)))
}
fact initialState {
(let s0 = (ord/first[]) {
(((s0.near) = Object) && (no (s0.far)))
})
}
fact stateTransition {
(all s: (one State),s': (one (s.(ord/next[]))) {
((Farmer = (s.near)) => (crossRiver[(s.far),(s'.far),(s.near),(s'.near)]) else (crossRiver[(s.near),(s'.near),(s.far),(s'.far)]))
})
}
assert NoQuantumObjects {
(no s: (one State) {
(some x: (one Object) {
((x in (s.near)) && (x in (s.far)))
})
})
}
run crossRiver for 300
run solvePuzzle for 300 expect 1
check NoQuantumObjects for 300 expect 0