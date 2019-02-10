module examples/puzzles/handshake
open util/integer [] as integer
sig Person {
spouse: (one Person),
shaken: (set Person)
}
one sig Jocelyn extends Person {}
one sig Hilary extends Person {}
pred Puzzle[] {
((all p,q: (one (Person - Jocelyn)) {
((p != q) => ((#(p.shaken)) != (#(q.shaken))))
}) && ((Hilary.spouse) = Jocelyn))
}

fact ShakingProtocol {
((all p: (one Person) {
(no ((p + (p.spouse)) & (p.shaken)))
}) && (all p,q: (one Person) {
((p in (q.shaken)) => (q in (p.shaken)))
}))
}
fact Spouses {
((all p,q: (one Person) {
((p != q) => ((((p.spouse) = q) => ((q.spouse) = p)) && ((p.spouse) != (q.spouse))))
}) || (all p: (one Person) {
((((p.spouse).(*spouse)) = p) && (p != (p.spouse)))
}))
}

run Puzzle for 8 int, exactly 14 Person expect 1
run Puzzle for 9 int, exactly 16 Person expect 1
run Puzzle for 10 int, exactly 16 Person expect 1
run Puzzle for 12 int, exactly 16 Person expect 1
