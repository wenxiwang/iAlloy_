module examples/toys/life
open util/integer [] as integer
open util/ordering [State] as ord
sig Point {
right: (lone Point),
below: (lone Point)
}
one sig Root extends Point {}
sig State {
live: (set Point)
}
pred Square[] {
((#(Root.(*right))) != (#(Root.(*below))))
}
pred Rectangle[] {

}
pred Trans[pre,post: State,p: Point] {
(let preLive = (LiveNeighborsInState[p,pre]) {
(((p !in (pre.live)) && ((#preLive) = 3)) => (p in (post.live)) else (((p in (pre.live)) && (((#preLive) = 2) || ((#preLive) = 3))) => (p in (post.live)) else (p !in (post.live))))
})
}
pred interesting[] {
((some (State.live)) && (some (Point - (State.live))) && (some right) && (some below))
}
fun Neighbors[p: Point] : (set Point) {
((((((((p.right) + ((p.right).below)) + (p.below)) + ((p.below).(~right))) + (p.(~right))) + ((p.(~right)).(~below))) + (p.(~below))) + ((p.(~below)).right))
}
fun LiveNeighborsInState[p: Point,s: State] : (set Point) {
((Neighbors[p]) & (s.live))
}
fact Acyclic {
(all p: (one Point) {
(p !in (p.(^(right + below))))
})
}
fact InnerSquaresCommute {
(all p: (one Point) {
((((p.below).right) = ((p.right).below)) && (((some (p.below)) || (some (p.right))) => (some ((p.below).right))))
})
}
fact TopRow {
(all p: (one (Point - Root)) {
((no (p.(~below))) => ((#(p.(*below))) = (#(Root.(*below)))))
})
}
fact Connected {
((Root.(*(right + below))) = Point)
}
fact ValidTrans {
(all pre: (one (State - (ord/last[]))) {
(let post = (pre.(ord/next[])) {
(all p: (one Point) {
(Trans[pre,post,p])
})
})
})
}

run Square for 11 expect 1
run Trans for 10
run interesting for 20 expect 1
