module list
open util/integer [] as integer
sig Thing {}
abstract sig List {
equivTo: (set List),
prefixes: (set List)
}
sig NonEmptyList extends List {
car: (some Thing),
cdr: (one List)
}
sig EmptyList extends List {}
pred isFinite[L: List] {
(some e: (one EmptyList) {
(e in (L.(*cdr)))
})
}
pred show[] {
(some a,b: (one NonEmptyList) {
((a != b) && (b in (a.prefixes)))
})
}

fact NoStrayThings {
(Thing in (List.car))
}
fact finite {
(all L: (one List) {
(isFinite[L])
})
}
fact Equivalence {
(all a,b: (one List) {
((a in (b.equivTo)) <=> (((a.car) = (b.car)) && ((b.cdr) in ((a.cdr).equivTo)) && ((#(a.(*cdr))) = (#(b.(*cdr))))))
})
}
fact prefix {
((all e: (one EmptyList),L: (one List) {
(e in (L.prefixes))
}) && (all a,b: (one NonEmptyList) {
((a in (b.prefixes)) <=> (((a.car) = (b.car)) && ((a.cdr) in ((b.cdr).prefixes)) && ((#(a.(*cdr))) < (#(b.(*cdr))))))
}))
}
assert reflexive {
(all L: (one List) {
(L in (L.equivTo))
})
}
assert symmetric {
(all a,b: (one List) {
((a in (b.equivTo)) <=> (b in (a.equivTo)))
})
}
assert empties {
(all a,b: (one EmptyList) {
(a in (b.equivTo))
})
}
run show for 35
check reflexive for 17 expect 0
check symmetric for 17 expect 0
check empties for 17 expect 0