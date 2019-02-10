pred test9 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
color = Node0->Red0
}}}}
}
run test9 for 3 expect 1
pred test6 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1
neighbors = Node0->Node1 + Node1->Node0
color = Node0->Blue0 + Node1->Red0
}}}}
}
run test6 for 3 expect 1
pred test15 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1
no neighbors
color = Node0->Blue0 + Node1->Red0
}}}}
}
run test15 for 3 expect 0
pred test22 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node1 + Node1->Node0 + Node1->Node2 + Node2->Node1
color = Node0->Blue0 + Node1->Blue0 + Node2->Red0
}}}}
}
run test22 for 3 expect 1
pred test2 {
some disj Blue0: Blue {some disj Blue0: Color {some disj Node0, Node1: Node {
no Red
Blue = Blue0
Color = Blue0
Node = Node0 + Node1
neighbors = Node0->Node1 + Node1->Node0
color = Node0->Blue0 + Node1->Blue0
}}}
}
run test2 for 3 expect 0
pred test4 {
some disj Red0: Red {some disj Red0: Color {some disj Node0, Node1: Node {
Red = Red0
no Blue
Color = Red0
Node = Node0 + Node1
neighbors = Node0->Node1 + Node1->Node0
color = Node0->Red0 + Node1->Red0
}}}
}
run test4 for 3 expect 0
