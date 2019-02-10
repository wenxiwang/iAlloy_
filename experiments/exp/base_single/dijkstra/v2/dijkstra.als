module examples/algorithms/dijkstra
open util/integer [] as integer
open util/ordering [State] as so
open util/ordering [Mutex] as mo
sig Process {}
sig Mutex {}
sig State {
holds,waits: (Process->Mutex)
}
pred Initial[s: State] {
(no ((s.holds) + (s.waits)))
}
pred IsFree[s: State,m: Mutex] {
(no (m.(~(s.holds))))
}
pred IsStalled[s: State,p: Process] {
(some (p.(s.waits)))
}
pred GrabMutex[s: State,p: Process,m: Mutex,s': State] {
((!(IsStalled[s,p])) && (m !in (p.(s.holds))) && (all m': (one (p.(s.holds))) {
(mo/lt[m',m])
}) && ((IsFree[s,m]) => (((p.(s'.holds)) = ((p.(s.holds)) + m)) && (no (p.(s'.waits)))) else (((p.(s'.holds)) = (p.(s.holds))) && ((p.(s'.waits)) = m))) && (all otherProc: (one (Process - p)) {
(((otherProc.(s'.holds)) = (otherProc.(s.holds))) && ((otherProc.(s'.waits)) = (otherProc.(s.waits))))
}))
}
pred ReleaseMutex[s: State,p: Process,m: Mutex,s': State] {
((!(IsStalled[s,p])) && (m in (p.(s.holds))) && ((p.(s'.holds)) = ((p.(s.holds)) - m)) && (no (p.(s'.waits))) && ((no (m.(~(s.waits)))) => ((no (m.(~(s'.holds)))) && (no (m.(~(s'.waits))))) else (some lucky: (one (m.(~(s.waits)))) {
(((m.(~(s'.waits))) = ((m.(~(s.waits))) - lucky)) && ((m.(~(s'.holds))) = lucky))
})) && (all mu: (one (Mutex + m)) {
(((mu.(~(s'.waits))) = (mu.(~(s.waits)))) && ((mu.(~(s'.holds))) = (mu.(~(s.holds)))))
}))
}
pred GrabOrRelease[] {
((Initial[(so/first[])]) && (all pre: (one (State - (so/last[]))) {
(let post = (pre.(so/next[])) {
((((post.holds) = (pre.holds)) && ((post.waits) = (pre.waits))) || (some p: (one Process),m: (one Mutex) {
(GrabMutex[pre,p,m,post])
}) || (some p: (one Process),m: (one Mutex) {
(ReleaseMutex[pre,p,m,post])
}))
})
}))
}
pred Deadlock[] {
((some Process) && (some s: (one State) {
(all p: (one Process) {
(some (p.(s.waits)))
})
}))
}
pred ShowDijkstra[] {
((GrabOrRelease[]) && (Deadlock[]) && (some waits))
}


assert DijkstraPreventsDeadlocks {
((GrabOrRelease[]) => (!(Deadlock[])))
}
run GrabMutex for 30
run ReleaseMutex for 35
run GrabOrRelease for 16
run Deadlock for 50 expect 1
run ShowDijkstra for 5 expect 1
check DijkstraPreventsDeadlocks for 6 expect 0