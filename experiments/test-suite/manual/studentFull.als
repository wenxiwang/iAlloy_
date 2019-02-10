/** all l: List | no l.header */
pred test1 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
}}}}
}
run test1 for 3 expect 1

/** all l: List | one l.header */
pred test2 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test2 for 3 expect 1
pred test3 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test3 for 3 expect 1
pred test4 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test4 for 3 expect 1

/** some l: List | #l.header > 1 */
pred test5 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test5 for 3 expect 0
pred test6 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test6 for 3 expect 0
pred test7 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node2
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test7 for 3 expect 0

/** all n: Node | no n.link */
pred test8 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test8 for 3 expect 1
pred test9 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test9 for 3 expect 1
pred test10 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->1
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test10 for 3 expect 1

/** all n: Node | one n.link */
pred test11 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test11 for 3 expect 1
pred test12 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test12 for 3 expect 1
pred test13 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->-4 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test13 for 3 expect 1

/** all n: Node | lone n.link */
pred test14 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->1 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test14 for 3 expect 1
pred test15 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->2 + Node1->0 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test15 for 3 expect 1
pred test16 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->2 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test16 for 3 expect 1

/** some n: Node | #{n.link} > 1 */
pred test17 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node0->Node2 + Node2->Node0 + Node2->Node1
elem = Node0->3 + Node1->-4 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test17 for 3 expect 0
pred test18 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node1->Node2 + Node2->Node0 + Node2->Node1
elem = Node0->2 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test18 for 3 expect 0
pred test19 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node1->Node2 + Node2->Node0 + Node2->Node1
elem = Node0->0 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test19 for 3 expect 0

/** all n: Node | no n.elem */
pred test20 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
no elem
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test20 for 3 expect 0
pred test21 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
no elem
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test21 for 3 expect 0
pred test22 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
no elem
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test22 for 3 expect 0

/** all n: Node | one n.elem */
pred test23 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test23 for 3 expect 1
pred test24 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test24 for 3 expect 1
pred test25 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->1 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test25 for 3 expect 1

/** all n: Node | lone n.elem */
pred test26 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node1->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test26 for 3 expect 0
pred test27 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node0
elem = Node0->-1 + Node1->-2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test27 for 3 expect 0
pred test28 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->3 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test28 for 3 expect 0

/** some n: Node | #n.elem > 1 */
pred test29 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node1->-4 + Node1->-3 + Node1->-2 + Node1->-1 + Node2->-3 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test29 for 3 expect 0
pred test30 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
elem = Node0->-4 + Node0->-3 + Node0->-2 + Node0->-1 + Node0->0 + Node0->1 + Node0->2 + Node0->3 + Node2->-4 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test30 for 3 expect 0
pred test31 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
elem = Node0->-4 + Node0->0 + Node1->-3 + Node1->-2 + Node1->-1 + Node1->1 + Node1->2 + Node1->3 + Node2->-4 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test31 for 3 expect 0

/** Loop: kill student3 */
pred test32 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test32 for 3 expect 1
pred test33 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test33 for 3 expect 1
pred test34 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->1
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test34 for 3 expect 1

pred test35 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-4 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test35 for 3 expect 1
pred test36 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test36 for 3 expect 1
pred test37 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->-2 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test37 for 3 expect 1

pred test38 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test38 for 3 expect 0
pred test39 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->3 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test39 for 3 expect 0
pred test40 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->2 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test40 for 3 expect 0

pred test41 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->1 + Node1->0 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test41 for 3 expect 0
pred test42 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->2 + Node1->1 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test42 for 3 expect 0
pred test43 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test43 for 3 expect 0

/** Loop: kill student6, student14 */
pred test44 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->-2 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test44 for 3 expect 1
pred test45 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test45 for 3 expect 1
pred test46 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test46 for 3 expect 1

pred test47 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}
}
run test47 for 3 expect 1


pred test48 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test48 for 3 expect 0
pred test49 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->3 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test49 for 3 expect 0
pred test50 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->-4
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test50 for 3 expect 0

/** Loop: kill student13 */
pred test51 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-4 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test51 for 3 expect 1
pred test52 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test52 for 3 expect 1
pred test53 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->-2 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test53 for 3 expect 1


pred test54 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->2 + Node1->-4 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test54 for 3 expect 0
pred test55 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-4 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test55 for 3 expect 0
pred test56 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test56 for 3 expect 0

pred test57 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test57 for 3 expect 0
pred test58 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->3 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test58 for 3 expect 0
pred test59 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->-1 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test59 for 3 expect 0

/** Loop: kill student16 */
pred test60 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-4 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test60 for 3 expect 1
pred test61 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test61 for 3 expect 1
pred test62 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->-2 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test62 for 3 expect 1

pred test63 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test63 for 3 expect 0
pred test64 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-2 + Node1->-3 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test64 for 3 expect 0
pred test65 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test65 for 3 expect 0

/** Loop: kill student17 */
pred test66 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test66 for 3 expect 1
pred test67 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->-1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test67 for 3 expect 1
pred test68 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test68 for 3 expect 1

pred test69 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}
}
run test69 for 3 expect 1


pred test70 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test70 for 3 expect 0
pred test71 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-2 + Node1->-3 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test71 for 3 expect 0
pred test72 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test72 for 3 expect 0

/** Loop: kill student18 */
pred test73 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->-1 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test73 for 3 expect 1
pred test74 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->-2 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test74 for 3 expect 1
pred test75 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test75 for 3 expect 1

pred test76 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test76 for 3 expect 0
pred test77 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->2
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test77 for 3 expect 0
pred test78 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->1
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test78 for 3 expect 0

pred test79 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test79 for 3 expect 0
pred test80 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->2 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test80 for 3 expect 0
pred test81 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->-1 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test81 for 3 expect 0

/** Sorted: kill student 0, 2, 4, 5, 6, 10, 14, 15, 17, 19 */
pred test82 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test82 for 3 expect 1
pred test83 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-3 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test83 for 3 expect 1
pred test84 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test84 for 3 expect 1

pred test85 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->-2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test85 for 3 expect 1
pred test86 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->-1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test86 for 3 expect 1
pred test87 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test87 for 3 expect 1


pred test88 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test88 for 3 expect 0
pred test89 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->1 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test89 for 3 expect 0
pred test90 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->3 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test90 for 3 expect 0

/** Sorted: kill student3 */
pred test91 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test91 for 3 expect 1
pred test92 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test92 for 3 expect 1
pred test93 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test93 for 3 expect 1

pred test94 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->3 + Node1->-3 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test94 for 3 expect 1
pred test95 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->-1 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test95 for 3 expect 1
pred test96 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test96 for 3 expect 1

pred test97 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->-4 + Node1->-3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test97 for 3 expect 0
pred test98 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->-1 + Node1->-4 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test98 for 3 expect 0
pred test99 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->-2 + Node1->-4 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test99 for 3 expect 0

pred test100 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->2 + Node1->0 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test100 for 3 expect 0
pred test101 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-4 + Node1->1 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test101 for 3 expect 0
pred test102 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-4 + Node1->-2 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test102 for 3 expect 0

/** Sorted: kill student 7, 8 */
pred test103 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test103 for 3 expect 1
pred test104 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-3 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test104 for 3 expect 1
pred test105 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test105 for 3 expect 1

pred test106 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->-4 + Node1->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test106 for 3 expect 1
pred test107 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->-4 + Node1->-4 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test107 for 3 expect 1
pred test108 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->1 + Node1->1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test108 for 3 expect 1


pred test109 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->1 + Node1->0 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test109 for 3 expect 0
pred test110 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->2 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test110 for 3 expect 0
pred test111 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-2 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test111 for 3 expect 0

/** Sorted: kill student11 */
pred test112 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test112 for 3 expect 1
pred test113 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test113 for 3 expect 1
pred test114 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test114 for 3 expect 1

pred test115 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->-2 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test115 for 3 expect 1
pred test116 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->-1 + Node1->-1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test116 for 3 expect 1
pred test117 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->0 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test117 for 3 expect 1


pred test118 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test118 for 3 expect 0
pred test119 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->1 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test119 for 3 expect 0
pred test120 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test120 for 3 expect 0

/** Sorted: kill student12 */
pred test121 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test121 for 3 expect 1
pred test122 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test122 for 3 expect 1
pred test123 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test123 for 3 expect 1

pred test124 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->-4 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test124 for 3 expect 1
pred test125 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->1 + Node1->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test125 for 3 expect 1
pred test126 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
elem = Node0->2 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test126 for 3 expect 1

pred test127 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-3 + Node1->-4 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test127 for 3 expect 0
pred test128 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-1 + Node1->-4 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test128 for 3 expect 0
pred test129 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node2 + Node2->Node0
elem = Node0->1 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test129 for 3 expect 0

pred test130 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node1 + Node1->Node0
elem = Node0->-1 + Node1->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test130 for 3 expect 0
pred test131 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->1 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test131 for 3 expect 0
pred test132 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-4 + Node1->3 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test132 for 3 expect 0

/** Sorted: kill student16 */
pred test133 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test133 for 3 expect 1
pred test134 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test134 for 3 expect 1
pred test135 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test135 for 3 expect 1


pred test136 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test136 for 3 expect 0
pred test137 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node1->Node2 + Node2->Node0
elem = Node0->0 + Node1->-4 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test137 for 3 expect 0
pred test138 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-2 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test138 for 3 expect 0

/** Sorted: kill student18 */
pred test139 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->1 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test139 for 3 expect 1
pred test140 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test140 for 3 expect 1
pred test141 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test141 for 3 expect 1

pred test142 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->-3 + Node1->-4 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test142 for 3 expect 1
pred test143 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->0 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test143 for 3 expect 1
pred test144 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test144 for 3 expect 1


pred test145 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test145 for 3 expect 0
pred test146 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
elem = Node0->0 + Node1->1 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test146 for 3 expect 0
pred test147 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->-3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test147 for 3 expect 0

/** Count: kill student16 */
pred test148 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->0 + Node1->-4 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,0]
}}}}}
}
run test148 for 3 expect 1
pred test149 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,1,0]
}}}}}
}
run test149 for 3 expect 1
pred test150 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,2]
}}}}}
}
run test150 for 3 expect 1


pred test151 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,2]
}}}}}
}
run test151 for 3 expect 0
pred test152 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-2,2]
}}}}}
}
run test152 for 3 expect 0
pred test153 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-4,0]
}}}}}
}
run test153 for 3 expect 0

pred test154 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-4,2]
}}}}}
}
run test154 for 3 expect 0
pred test155 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-4,3]
}}}}}
}
run test155 for 3 expect 0
pred test156 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,3]
}}}}}
}
run test156 for 3 expect 0

/** Count: kill student18 */
pred test157 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,3]
}}}}}
}
run test157 for 3 expect 1
pred test158 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-1,3]
}}}}}
}
run test158 for 3 expect 1
pred test159 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,3]
}}}}}
}
run test159 for 3 expect 1

pred test160 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-1,0]
}}}}}
}
run test160 for 3 expect 1
pred test161 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,0]
}}}}}
}
run test161 for 3 expect 1
pred test162 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,0,0]
}}}}}
}
run test162 for 3 expect 1

pred test163 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-1,3]
}}}}}
}
run test163 for 3 expect 0
pred test164 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,3]
}}}}}
}
run test164 for 3 expect 0
pred test165 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,0,3]
}}}}}
}
run test165 for 3 expect 0

pred test166 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->2 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,2]
}}}}}
}
run test166 for 3 expect 0
pred test167 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->-1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-1,2]
}}}}}
}
run test167 for 3 expect 0
pred test168 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,1]
}}}}}
}
run test168 for 3 expect 0

/** Count: kill student19 */
pred test169 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,2,1]
}}}}}
}
run test169 for 3 expect 1
pred test170 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->-1
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-1,1]
}}}}}
}
run test170 for 3 expect 1
pred test171 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,1]
}}}}}
}
run test171 for 3 expect 1

pred test172 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-4,0]
}}}}}
}
run test172 for 3 expect 1
pred test173 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,2]
}}}}}
}
run test173 for 3 expect 1
pred test174 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-2,0]
}}}}}
}
run test174 for 3 expect 1

pred test175 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-4 + Node1->-4 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-4,1]
}}}}}
}
run test175 for 3 expect 0
pred test176 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->3 + Node1->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,3,1]
}}}}}
}
run test176 for 3 expect 0
pred test177 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-2,1]
}}}}}
}
run test177 for 3 expect 0

pred test178 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-4,2]
}}}}}
}
run test178 for 3 expect 0
pred test179 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->0 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-2,2]
}}}}}
}
run test179 for 3 expect 0
pred test180 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-1,2]
}}}}}
}
run test180 for 3 expect 0

/** Contains: kill student2 */
pred test181 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test181 for 3 expect 1
pred test182 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test182 for 3 expect 1
pred test183 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,False0]
}}}}}
}
run test183 for 3 expect 1


pred test184 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,True0]
}}}}}
}
run test184 for 3 expect 0
pred test185 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test185 for 3 expect 0
pred test186 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,True0]
}}}}}
}
run test186 for 3 expect 0

pred test187 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,False0]
}}}}}
}
run test187 for 3 expect 0
pred test188 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->0 + Node1->2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-3,False0]
}}}}}
}
run test188 for 3 expect 0
pred test189 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,True0]
}}}}}
}
run test189 for 3 expect 0

/** Contains: kill student9 */
pred test190 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test190 for 3 expect 1
pred test191 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,False0]
}}}}}
}
run test191 for 3 expect 1
pred test192 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,True0]
}}}}}
}
run test192 for 3 expect 1


pred test193 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,True0]
}}}}}
}
run test193 for 3 expect 0
pred test194 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,True0]
}}}}}
}
run test194 for 3 expect 0
pred test195 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,True0]
}}}}}
}
run test195 for 3 expect 0

pred test196 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-1,False0]
}}}}}
}
run test196 for 3 expect 0
pred test197 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test197 for 3 expect 0
pred test198 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,True0]
}}}}}
}
run test198 for 3 expect 0

/** Contains: kill student12 */
pred test199 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-1,False0]
}}}}}
}
run test199 for 3 expect 1
pred test200 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,False0]
}}}}}
}
run test200 for 3 expect 1
pred test201 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-4,False0]
}}}}}
}
run test201 for 3 expect 1

pred test202 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,True0]
}}}}}
}
run test202 for 3 expect 1
pred test203 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test203 for 3 expect 1
pred test204 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-3 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-4,True0]
}}}}}
}
run test204 for 3 expect 1

pred test205 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->3 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,False0]
}}}}}
}
run test205 for 3 expect 0
pred test206 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,False0]
}}}}}
}
run test206 for 3 expect 0
pred test207 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-3 + Node1->-3 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-4,False0]
}}}}}
}
run test207 for 3 expect 0

pred test208 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-1,True0]
}}}}}
}
run test208 for 3 expect 0
pred test209 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test209 for 3 expect 0
pred test210 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->-4 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test210 for 3 expect 0

/** Contains: kill student16 */
pred test211 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->1 + Node1->1 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test211 for 3 expect 1
pred test212 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,False0]
}}}}}
}
run test212 for 3 expect 1
pred test213 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,0,True0]
}}}}}
}
run test213 for 3 expect 1


pred test214 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->0 + Node1->0 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-1,True0]
}}}}}
}
run test214 for 3 expect 0
pred test215 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-1 + Node1->-1 + Node2->-2
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test215 for 3 expect 0
pred test216 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,3,True0]
}}}}}
}
run test216 for 3 expect 0

pred test217 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-1,False0]
}}}}}
}
run test217 for 3 expect 0
pred test218 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->-2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test218 for 3 expect 0
pred test219 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->-4 + Node2->-3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test219 for 3 expect 0

/** Contains: kill student19 */
pred test220 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->0
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test220 for 3 expect 1
pred test221 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->2 + Node1->2 + Node2->1
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test221 for 3 expect 1
pred test222 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-2 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-2,True0]
}}}}}
}
run test222 for 3 expect 1


pred test223 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-4,True0]
}}}}
}
run test223 for 3 expect 0
pred test224 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-3,True0]
}}}}
}
run test224 for 3 expect 0
pred test225 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}
}
run test225 for 3 expect 0

pred test226 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-1,True0]
}}}}}
}
run test226 for 3 expect 0
pred test227 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->2 + Node2->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,1,True0]
}}}}}
}
run test227 for 3 expect 0
pred test228 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->3 + Node1->-2 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,2,True0]
}}}}}
}
run test228 for 3 expect 0
