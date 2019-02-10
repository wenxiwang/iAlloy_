module FullTree
open util/integer [] as integer
sig Node {
left: (set Node),
right: (set Node)
}
pred Acyclic[] {
(one n: (one Node) {
((n !in (n.(^(left + right)))) && (lone (n.(~(left + right)))) && (no ((n.left) & (n.right))))
})
}
pred makeFull[] {
(all n: (one Node) {
((#(n.(*left))) = (#(n.(*right))))
})
}
pred FullTree[] {
((Acyclic[]) && (makeFull[]))
}

fact fact_1 {
(all n: (one Node) {
((lone (n.left)) && (no (n.(~right))))
})
}

run Acyclic for 55
run makeFull for 40
run FullTree for 35
