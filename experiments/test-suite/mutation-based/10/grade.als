pred test36 {
some disj Student0: Student {some disj Professor0, Professor1: Professor {some disj Student0, Professor0, Professor1: Person {some disj Class0, Class1, Class2: Class {some disj Assignment0, Assignment1, Assignment2: Assignment {
Student = Student0
Professor = Professor0 + Professor1
Person = Student0 + Professor0 + Professor1
Class = Class0 + Class1 + Class2
assistant_for = Class2->Student0
instructor_of = Class0->Professor0 + Class1->Professor0 + Class2->Professor1
Assignment = Assignment0 + Assignment1 + Assignment2
associated_with = Assignment0->Class2 + Assignment1->Class1 + Assignment2->Class0
assigned_to = Assignment0->Student0 + Assignment1->Student0 + Assignment2->Student0
PolicyAllowsGrading[Professor1,Assignment2]
}}}}}
}
run test36 for 3 expect 0
pred test5 {
some disj Professor0, Professor1, Professor2: Professor {some disj Professor0, Professor1, Professor2: Person {some disj Class0, Class1, Class2: Class {
no Student
Professor = Professor0 + Professor1 + Professor2
Person = Professor0 + Professor1 + Professor2
Class = Class0 + Class1 + Class2
no assistant_for
instructor_of = Class0->Professor2 + Class1->Professor1 + Class2->Professor0
no Assignment
no associated_with
no assigned_to
}}}
}
run test5 for 3 expect 1
pred test26 {
some disj Student0, Student1: Student {some disj Professor0: Professor {some disj Student0, Professor0, Student1: Person {some disj Class0, Class1, Class2: Class {some disj Assignment0, Assignment1, Assignment2: Assignment {
Student = Student0 + Student1
Professor = Professor0
Person = Student0 + Professor0 + Student1
Class = Class0 + Class1 + Class2
assistant_for = Class0->Student0 + Class0->Student1 + Class1->Student0 + Class1->Student1 + Class2->Student0 + Class2->Student1
instructor_of = Class0->Professor0 + Class1->Professor0 + Class2->Professor0
Assignment = Assignment0 + Assignment1 + Assignment2
associated_with = Assignment0->Class2 + Assignment1->Class1 + Assignment2->Class1
assigned_to = Assignment0->Student1 + Assignment1->Student0 + Assignment1->Student1 + Assignment2->Student1
PolicyAllowsGrading[Student1,Assignment2]
}}}}}
}
run test26 for 3 expect 0
pred test39 {
some disj Student0, Student1: Student {some disj Professor0: Professor {some disj Student0, Professor0, Student1: Person {some disj Class0, Class1, Class2: Class {some disj Assignment0, Assignment1, Assignment2: Assignment {
Student = Student0 + Student1
Professor = Professor0
Person = Student0 + Professor0 + Student1
Class = Class0 + Class1 + Class2
assistant_for = Class0->Student0 + Class0->Student1 + Class1->Student0 + Class1->Student1 + Class2->Student0 + Class2->Student1
instructor_of = Class0->Professor0 + Class1->Professor0 + Class2->Professor0
Assignment = Assignment0 + Assignment1 + Assignment2
associated_with = Assignment0->Class2 + Assignment1->Class1 + Assignment2->Class1
assigned_to = Assignment0->Student1 + Assignment1->Student1 + Assignment2->Student0 + Assignment2->Student1
PolicyAllowsGrading[Student1,Assignment2]
}}}}}
}
run test39 for 3 expect 0