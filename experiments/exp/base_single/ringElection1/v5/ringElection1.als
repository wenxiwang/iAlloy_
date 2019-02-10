module chapter6/ringElection1
open util/integer [] as integer
open util/ordering [Time] as TO
open util/ordering [Process] as PO
sig Time {}
sig Process {
succ: (one Process),
toSend: (Process->Time),
elected: (one Time)
}
pred init[t: Time] {
(all p: (one Process) {
(((p.toSend).t) in p)
})
}
pred step[t,t': Time,p: Process] {
(let from = (p.toSend) {
(let to = ((p.succ).toSend) {
(some id: (one (from.t)) {
(((from.t') = ((from.t) - id)) && ((to.t') = ((to.t) + (id - (PO/prevs[(p.succ)])))))
})
})
})
}
pred skip[t,t': Time,p: Process] {
(((p.toSend).t) = ((p.toSend).t'))
}
pred show[] {
(some elected)
}

fact ring {
(all p: (one Process) {
(Process in (p.(^succ)))
})
}
fact defineElected {
((no (elected.(TO/first[]))) && (all t: (one (Time - (TO/first[]))) {
((elected.t) = ({ p: (one Process) {
(p != (((p.toSend).t) - ((p.toSend).(t.(TO/prev[])))))
} }))
}))
}
fact traces {
((init[(TO/first[])]) && (all t: (one ((TO/last[]) - Time)) {
(let t' = (t.(TO/next[])) {
(all p: (one Process) {
((step[t,t',p]) || (step[t,t',(succ.p)]) || (skip[t,t',p]))
})
})
}))
}
assert AtMostOneElected {
(lone (elected.Time))
}
assert AtLeastOneElected {
(some t: (one Time) {
(some (elected.t))
})
}
run init for 12
run step for 10
run skip for 12
run show for 10
check AtMostOneElected for 7
check AtLeastOneElected for 10