module language/grandpa3
open util/integer [] as integer
abstract sig Person {
father: (lone Man),
mother: (lone Woman)
}
sig Man extends Person {
wife: (lone Woman)
}
lone sig Woman extends Person {
husband: (lone Man)
}
pred ownGrandpa[p: Person] {
(p in (grandpas[p]))
}
pred SocialConvention1[] {
(no ((wife + husband) & (^(mother + father))))
}
pred SocialConvention2[] {
(let parent = (mother + father) {
((no m: (one Man) {
((some (m.wife)) && ((m.wife) in ((m.(*parent)).mother)))
}) && (no w: (one Woman) {
((some (w.husband)) && (((w.(*parent)).father) = (w.husband)))
}))
})
}
fun grandpas[p: Person] : (set Person) {
(let parent = (((mother + father) + (father.wife)) + (mother.husband)) {
(((p.parent).parent) & Man)
})
}
fact Biology {
(no p: (one Person) {
(p in (p.(^(mother + father))))
})
}
fact Terminology {
(wife = (~husband))
}
fact SocialConvention {
(no ((wife + husband) & (^(mother + father))))
}
assert NoSelfFather {
(no m: (one Man) {
(m = (m.father))
})
}
assert Same {
((SocialConvention1[]) <=> (SocialConvention2[]))
}
run ownGrandpa for 40
run SocialConvention1 for 40
run SocialConvention2 for 40
check NoSelfFather for 40
check Same for 7