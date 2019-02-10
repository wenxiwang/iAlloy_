pred test46 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node0->Node1 + Node1->Node0
elem = Node0->-7 + Node1->-8
}}
}
run test46 for 3 expect 0
pred test40 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node2 + Node1->Node0
nxt = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->-7 + Node2->-8
ConsistentPreAndNxt[]
}}
}
run test40 for 3 expect 1
pred test48 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node0->Node0 + Node1->Node0
elem = Node0->-7 + Node1->-8
}}
}
run test48 for 3 expect 0
pred test17 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->7 + Node1->7
UniqueElem[]
}}
}
run test17 for 3 expect 0
pred test9 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->6 + Node1->5
}}
}
run test9 for 3 expect 1
pred test10 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->5 + Node1->6
}}
}
run test10 for 3 expect 1
pred test30 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-3 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test30 for 3 expect 1
pred test34 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
ConsistentPreAndNxt[]
}}
}
run test34 for 3 expect 0
pred test45 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node0 + Node1->Node2
nxt = Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->-7 + Node2->-8
RepOk[]
}}
}
run test45 for 3 expect 0
pred test21 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-1 + Node1->-1
UniqueElem[]
}}
}
run test21 for 3 expect 0
pred test12 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
no elem
}}
}
run test12 for 3 expect 0
pred test44 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node1 + Node1->Node2
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-7 + Node1->-8 + Node2->0
RepOk[]
}}
}
run test44 for 3 expect 0
pred test2 {
some disj DLL0, DLL1: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0 + DLL1
header = DLL1->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node0->Node1 + Node2->Node0
elem = Node0->6 + Node1->5 + Node2->0
}}
}
run test2 for 3 expect 0
pred test11 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-8 + Node0->-7 + Node0->-6 + Node0->-5 + Node0->-4 + Node0->-3 + Node0->-2 + Node0->-1 + Node0->0 + Node0->1 + Node0->2 + Node0->3 + Node0->4
}}
}
run test11 for 3 expect 0
