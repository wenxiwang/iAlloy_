sig List {
    header: set Node
}

sig Node {
    link: set Node,
    elem: set Int,
}

// Correct
fact CardinalityConstraints {
    all l: List | lone l.header
    all n: Node | lone n.link  
    all n: Node | one n.elem 
}

fact allNodesInList{
    all n: Node | one l: List | some n => n = l.header || n in l.header.^link 
}

// Correct
pred Loop(This: List) {
    no This.header || one n: This.header.*link | n.*link = n.^link
}

// Correct.
pred Sorted(This: List) {
    all n: This.header.*link | some n.link => n.elem <= n.link.elem
}

pred RepOk(This: List) {
    Loop[This]
    Sorted[This]
}

// Correct
pred Count(This: List, x: Int, result: Int){
    RepOk[This]
    result = #{n:This.header.*link | n.elem = x}
}

abstract sig Boolean {}
one sig True, False extends Boolean {}

// Correct
pred Contains(This: List, x: Int, result: Boolean) {
    RepOk[This]
    some {n:This.header.*link | n.elem = x}  => result = True 
    no {n:This.header.*link | n.elem = x}  => result = False
}

run Loop for 20
run Sorted for 18
run RepOk for 17
run Count for 17
run Contains for 17