module BinaryTree
open util/integer [] as integer
sig Node {
left: (set Node),
right: (set Node)
}
pred Acyclic[] {
(no n: (one Node) {
((n !in (n.(^(left + right)))) && (lone (n.(~(left + right)))) && (no ((n.left) + (n.right))))
})
}

fact fact_1 {
(all n: (one Node) {
((lone (n.left)) && (one (n.right)))
})
}

run Acyclic for 50
