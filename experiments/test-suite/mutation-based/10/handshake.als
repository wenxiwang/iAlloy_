pred test25 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0, Person1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0 + Person1
spouse = Jocelyn0->Person0 + Hilary0->Person1 + Person0->Jocelyn0 + Person1->Hilary0
shaken = Jocelyn0->Hilary0 + Jocelyn0->Person1 + Hilary0->Person0 + Person0->Hilary0 + Person0->Person1 + Person1->Jocelyn0 + Person1->Person0
}}}
}
run test25 for 4 expect 0
pred test29 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0, Person1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0 + Person1
spouse = Jocelyn0->Hilary0 + Hilary0->Jocelyn0 + Person0->Person1 + Person1->Person0
shaken = Hilary0->Person1 + Person1->Hilary0
}}}
}
run test29 for 4 expect 1
pred test6 {
some disj Jocelyn0: Jocelyn {some disj Jocelyn0, Person0, Person1, Person2: Person {
Jocelyn = Jocelyn0
no Hilary
Person = Jocelyn0 + Person0 + Person1 + Person2
spouse = Jocelyn0->Person2 + Person0->Person1 + Person1->Person0 + Person2->Jocelyn0
no shaken
}}
}
run test6 for 4 expect 0
