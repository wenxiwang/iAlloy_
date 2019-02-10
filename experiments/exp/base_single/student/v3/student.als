module unknown
open util/integer [] as integer
sig List {
header: (set Node)
}
sig Node {
link: (set Node),
elem: (set Int)
}
abstract sig Boolean {}
one sig True extends Boolean {}
one sig False extends Boolean {}
pred Loop[This: List] {
((no (This.header)) || (one n: (one ((This.header).(*link))) {
(n = (n.link))
}))
}
pred Sorted[This: List] {
(lone n: (one ((This.header).(*link))) {
((no (n.link)) || ((n.elem) <= ((n.link).elem)))
})
}
pred RepOk[This: List] {
((Loop[This]) && (Sorted[This]))
}
pred Count[This: List,x: Int,result: Int] {
((RepOk[This]) && (result = (#({ n: (one ((This.header).(*link))) {
((n.elem) = x)
} }))))
}
pred Contains[This: List,x: Int,result: Boolean] {
((RepOk[This]) && ((some n: (one ((This.header).(*link))) {
((n.elem) = x)
}) => (result = True) else (result = False)))
}

fact CardinalityConstraints {
((all l: (one List) {
(lone (l.header))
}) && (all n: (one Node) {
(lone (n.link))
}) && (all n: (one Node) {
(no (n.elem))
}))
}
fact IGNORE {
((one List) && (((List.header).(*link)) = Node))
}

run Loop for 20
run Sorted for 18
run RepOk for 17
run Count for 17
run Contains for 17
