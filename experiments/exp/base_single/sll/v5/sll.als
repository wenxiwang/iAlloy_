module SinglyLinkedList
open util/integer [] as integer
some sig List {
header: (one Node)
}
sig Node {
link: (set Node)
}
pred Acyclic[l: List] {
((some (l.header)) || (some n: (one ((l.header).(*link))) {
(no (n.link))
}))
}



run Acyclic
