pred test9 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1
}}
}
run test9 for 3 expect 1
pred test6 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
run test6 for 3 expect 1
pred test15 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
Acyclic[List0]
}}
}
run test15 for 3 expect 0
pred test22 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1 + Node2->Node0
Acyclic[List0]
}}
}
run test22 for 3 expect 1
pred test2 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List1->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
run test2 for 3 expect 1
pred test4 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
}}
}
run test4 for 3 expect 0
pred test17 {
some disj List0, List1, List2: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1 + List2
header = List0->Node2 + List1->Node1 + List2->Node0
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node2->Node1
Acyclic[List2]
}}
}
run test17 for 3 expect 1
pred test18 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
Acyclic[List0]
}}
}
run test18 for 3 expect 0
