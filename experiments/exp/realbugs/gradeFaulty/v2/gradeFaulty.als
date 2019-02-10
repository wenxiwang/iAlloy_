
abstract sig Person {}
sig Student extends Person {}
sig Professor extends Person {}
sig Class {
	assistant_for: set Student,   // as in : "is TA for"
	instructor_of: one Professor
}
sig Assignment {
	associated_with: one Class,
	assigned_to: some Student
}

pred PolicyAllowsGrading(s: Person, a: Assignment) {
	s in a.associated_with.assistant_for or s in a.associated_with.instructor_of
	// Fix: add "s !in a.assigned_to".
}
assert NoOneCanGradeTheirOwnAssignment {
	all s : Person | all a: Assignment | PolicyAllowsGrading[s, a] implies not s in a.assigned_to 
}

run PolicyAllowsGrading for 100
check NoOneCanGradeTheirOwnAssignment for 200
