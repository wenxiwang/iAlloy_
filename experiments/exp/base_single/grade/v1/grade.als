module unknown
open util/integer [] as integer
abstract sig Person {}
sig Student extends Person {}
sig Professor extends Person {}
sig Class {
assistant_for: (set Student),
instructor_of: (one Professor)
}
sig Assignment {
associated_with: (one Class),
assigned_to: (some Student)
}
pred PolicyAllowsGrading[s: Person,a: Assignment] {
(((s in ((a.associated_with).assistant_for)) || (s in ((a.associated_with).instructor_of))) && (s !in (a.assigned_to)))
}


assert NoOneCanGradeTheirOwnAssignment {
(all s: (one Person) {
(all a: (one Assignment) {
((PolicyAllowsGrading[s,a]) => (!(s in (a.assigned_to))))
})
})
}
run PolicyAllowsGrading for 100
check NoOneCanGradeTheirOwnAssignment for 200