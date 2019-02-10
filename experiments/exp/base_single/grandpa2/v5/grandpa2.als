module language/grandpa2
open util/integer [] as integer
abstract sig Person {
father: (lone Man),
mother: (lone Woman)
}
sig Man extends Person {
wife: (lone Woman)
}
sig Woman extends Person {
husband: (lone Man)
}
pred ownGrandpa[p: Person] {
(p in (grandpas[p]))
}
fun grandpas[p: Person] : (set Person) {
(let parent = (((*(~(mother + father))) + (father.wife)) - (mother.husband)) {
(((p.parent).parent) & Man)
})
}
fact fact_1 {

}
assert NoSelfFather {
(no m: (one Man) {
(m = (m.father))
})
}
run ownGrandpa for 50
check NoSelfFather for 40