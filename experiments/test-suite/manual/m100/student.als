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