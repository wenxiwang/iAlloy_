pred test37 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node0 + Node0->Node1 + Node1->Node1
}
}
run test37 for 3 expect 0
pred test13 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node1->Node1
Acyclic[]
}
}
run test13 for 3 expect 0
pred test5 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0
right = Node0->Node0
}
}
run test5 for 3 expect 1
pred test16 {
some disj Node0: Node {
Node = Node0
no left
right = Node0->Node0
Acyclic[]
}
}
run test16 for 3 expect 0
