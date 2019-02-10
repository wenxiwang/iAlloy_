opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room1 + Key1->Room1 + Key2->Room0
opened_by = Key0->secure_lab0 + Key1->secure_lab0 + Key2->secure_lab0
opened_by = Key0->Room1 + Key1->Room0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room0 + Key1->Room0 + Key2->Room0
opened_by = Key0->Room0 + Key1->secure_lab0 + Key2->Room0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->secure_lab0 + Key0->Room0
opened_by = Key0->Room0
opened_by = Key0->Room0 + Key1->secure_lab0 + Key1->Room0 + Key2->secure_lab0 + Key2->Room0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room1 + Key1->Room0 + Key2->Room0
opened_by = Key0->Room0 + Key1->secure_lab0
opened_by = Key0->Room0 + Key1->Room0 + Key2->Room0
opened_by = Key0->Room0 + Key1->Room0 + Key2->secure_lab0
opened_by = Key0->Room0 + Key1->Room0 + Key2->Room0
opened_by = Key0->Room0
pred test9 {
some disj secure_lab0: secure_lab {some disj secure_lab0, Room0: Room {some disj Employee0: Employee {some disj Researcher0, Researcher1: Researcher {some disj Researcher0, Researcher1, Employee0: Person {some disj Key0, Key1, Key2: Key {
secure_lab = secure_lab0
Room = secure_lab0 + Room0
Employee = Employee0
Researcher = Researcher0 + Researcher1
Person = Researcher0 + Researcher1 + Employee0
owns = Researcher0->Key2 + Researcher1->Key0 + Researcher1->Key1
Key = Key0 + Key1 + Key2
authorized = Key0->Employee0 + Key1->Employee0 + Key2->Employee0
}}}}}}
}
run test9 for 3 expect 1
pred test6 {
some disj secure_lab0: secure_lab {some disj secure_lab0, Room0: Room {some disj Employee0: Employee {some disj Researcher0, Researcher1: Researcher {some disj Researcher0, Employee0, Researcher1: Person {some disj Key0, Key1, Key2: Key {
secure_lab = secure_lab0
Room = secure_lab0 + Room0
Employee = Employee0
Researcher = Researcher0 + Researcher1
Person = Researcher0 + Employee0 + Researcher1
owns = Researcher0->Key0 + Researcher0->Key1 + Researcher1->Key0 + Researcher1->Key1
Key = Key0 + Key1 + Key2
authorized = Key0->Employee0 + Key1->Employee0 + Key2->Employee0
}}}}}}
}
run test6 for 3 expect 1
pred test10 {
some disj secure_lab0: secure_lab {some disj secure_lab0, Room0: Room {some disj Employee0: Employee {some disj Researcher0: Researcher {some disj Researcher0, Employee0: Person {some disj Key0, Key1, Key2: Key {
secure_lab = secure_lab0
Room = secure_lab0 + Room0
Employee = Employee0
Researcher = Researcher0
Person = Researcher0 + Employee0
owns = Researcher0->Key0 + Researcher0->Key1 + Researcher0->Key2
Key = Key0 + Key1 + Key2
authorized = Key0->Employee0 + Key1->Employee0 + Key2->Employee0
}}}}}}
}
run test10 for 3 expect 1
pred test15 {
some disj secure_lab0: secure_lab {some disj secure_lab0, Room0: Room {some disj Employee0, Employee1: Employee {some disj Employee0, Employee1: Person {some disj Key0, Key1, Key2: Key {
secure_lab = secure_lab0
Room = secure_lab0 + Room0
Employee = Employee0 + Employee1
no Researcher
Person = Employee0 + Employee1
no owns
Key = Key0 + Key1 + Key2
authorized = Key0->Employee1 + Key1->Employee0 + Key1->Employee1 + Key2->Employee0 + Key2->Employee1
}}}}}
}
run test15 for 3 expect 0
pred test21 {
some disj secure_lab0: secure_lab {some disj secure_lab0, Room0: Room {some disj Employee0: Employee {some disj Researcher0, Researcher1: Researcher {some disj Researcher0, Employee0, Researcher1: Person {some disj Key0, Key1: Key {
secure_lab = secure_lab0
Room = secure_lab0 + Room0
Employee = Employee0
Researcher = Researcher0 + Researcher1
Person = Researcher0 + Employee0 + Researcher1
owns = Researcher0->Key0 + Researcher1->Key0
Key = Key0 + Key1
authorized = Key0->Employee0 + Key1->Employee0
CanEnter[Researcher1,secure_lab0]
}}}}}}
}
run test21 for 3 expect 0
