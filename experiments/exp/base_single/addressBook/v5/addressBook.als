module chapter5/addressBook
open util/integer [] as integer
abstract sig Target {}
lone sig Addr extends Target {}
sig Name extends Target {}
sig Book {
addr: (Name->Target)
}
pred add[b,b': Book,n: Name,t: Target] {
((b'.addr) = ((b.addr) + (n->t)))
}
fun lookup[b: Book,n: Name] : (set Addr) {
((n.(^(b.addr))) & Addr)
}
fact Acyclic {
(one b: (one Book) {
(some n: (one Name) {
(n in (n.(^(b.addr))))
})
})
}
assert addLocal {
(all b,b': (one Book),n,n': (one Name),t: (one Target) {
(((add[b,b',n,t]) && (n != n')) => ((lookup[b,n']) = (lookup[b',n'])))
})
}
run add for 16
check addLocal for 16
