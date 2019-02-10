module unknown
open util/integer [] as integer
one sig DLL {
header: (lone Node)
}
sig Node {
pre,nxt: (lone Node),
elem: (one Int)
}
pred UniqueElem[] {
(no disj n1,n2: (one Node) {
((n1.elem) = (n2.elem))
})
}
pred Sorted[] {
(all n: (one Node) {
((some (n.nxt)) => ((n.elem) <= ((n.nxt).elem)))
})
}
pred ConsistentPreAndNxt[] {
(nxt = (~pre))
}
pred RepOk[] {
((UniqueElem[]) && (Sorted[]) && (ConsistentPreAndNxt[]))
}

fact Reachable {
(Node = ((DLL.header).(*nxt)))
}
fact Acyclic {
(all n: (one Node) {
(n !in (n.(^nxt)))
})
}

run UniqueElem for 15
run Sorted for 16
run ConsistentPreAndNxt for 18
run RepOk for 16
