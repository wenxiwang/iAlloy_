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
