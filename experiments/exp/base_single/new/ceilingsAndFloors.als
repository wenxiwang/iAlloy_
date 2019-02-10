module models/examples/toys/CeilingsAndFloors
open util/integer [] as integer
sig Platform {}
sig Man {
ceiling,floor: (one Platform)
}
pred Above[m,n: Man] {
((m.floor) = (n.ceiling))
}
pred Geometry[] {
(no m: (one Man) {
((m.floor) = (m.ceiling))
})
}
pred NoSharing[] {
(no m,n: (one Man) {
((m != n) && (((m.floor) = (n.floor)) || ((m.ceiling) = (n.ceiling))))
})
}

fact PaulSimon {
(all m: (one Man) {
(some n: (one Man) {
(Above[n,m])
})
})
}
assert BelowToo {
(all m: (one Man) {
(some n: (one Man) {
(Above[m,n])
})
})
}
assert BelowToo' {
((Geometry[]) => (all m: (one Man) {
(some n: (one Man) {
(Above[m,n])
})
}))
}
assert BelowToo'' {
((NoSharing[]) => (all m: (one Man) {
(some n: (one Man) {
(Above[m,n])
})
}))
}
run Above for 60
run Geometry for 60
run NoSharing for 60
check BelowToo for 60 expect 1
check BelowToo' for 20 expect 0
check BelowToo'' for 10 expect 0