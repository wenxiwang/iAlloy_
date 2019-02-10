module language/grandpa1
open util/integer [] as integer
abstract some sig Person {
father: (one Man),
mother: (lone Woman)
}
sig Man extends Person {
wife: (some Woman)
}
sig Woman extends Person {
husband: (lone Man)
}
pred ownGrandpa[p: Person] {
(p in (grandpas[p]))
}
fun grandpas[p: Person] : (set Person) {
((p.(mother + father)).father)
}
fact fact_1 {
((no p: (one Person) {
(p in (p.(^(mother + father))))
}) && (wife = (~husband)))
}
assert NoSelfFather {
(no m: (one Man) {
(m = (m.father))
})
}
assert NoSelfGrandpa {
(no p: (one Person) {
(p in (grandpas[p]))
})
}
run ownGrandpa for 50
check NoSelfFather for 50
check NoSelfGrandpa for 50