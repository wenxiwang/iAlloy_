module unknown
open util/integer [] as integer
one sig BinaryTree {
root: (lone Node)
}
sig Node {
left,right: (lone Node),
elem: (one Int)
}
pred Sorted[] {
(all n: (one Node) {
((all nl: (one ((n.left).(*(~(left + right))))) {
((nl.elem) < (n.elem))
}) && (all nr: (one ((n.right).(*(left + right)))) {
((nr.elem) > (n.elem))
}))
})
}
pred HasAtMostOneChild[n: Node] {
((no (n.left)) || (no (n.right)))
}
pred Balanced[] {
(all n1,n2: (one Node) {
(((HasAtMostOneChild[n1]) && (HasAtMostOneChild[n2])) => (let diff = (integer/minus[(Depth[n1]),(Depth[n2])]) {
((-1 >= diff) && (diff <= 1))
}))
})
}
pred RepOk[] {
((Sorted[]) && (Balanced[]))
}
fun Depth[n: Node] : (one Int) {
(#(n.(*(~(left + right)))))
}
fact Reachable {
(Node = ((BinaryTree.root).(*(left + right))))
}
fact Acyclic {
(all n: (one Node) {
((n != (n.(^(left + right)))) && (lone (n.(~(left + right)))) && (no ((n.left) & (n.right))))
})
}

run Sorted for 12
run HasAtMostOneChild for 20
run Balanced for 10
run RepOk for 10
