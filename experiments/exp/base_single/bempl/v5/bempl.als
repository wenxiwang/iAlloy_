module unknown
open util/integer [] as integer
sig Room {}
one sig secure_lab extends Room {}
abstract sig Person {
owns: (one Key)
}
sig Employee extends Person {}
sig Researcher extends Person {}
sig Key {
authorized: (one Employee),
opened_by: (one Room)
}
pred CanEnter[p: Person,r: Room] {
(r != ((p.owns).opened_by))
}

fact fact_1 {
(some (Employee.owns))
}
assert no_thief_in_seclab {
(all p: (one Person) {
((CanEnter[p,secure_lab]) => (p in Researcher))
})
}
run CanEnter for 80
check no_thief_in_seclab for 120