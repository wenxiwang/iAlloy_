pred test42 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->3
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test42 for 4 expect 1
pred test30 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->3 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test30 for 4 expect 1
pred test70 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->4 + Queen1->4 + Queen2->4 + Queen3->3
col = Queen0->1 + Queen1->1 + Queen2->1 + Queen3->1
}
}
run test70 for 4 expect 0
pred test75 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->4
}
}
run test75 for 4 expect 0
pred test39 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->3 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test39 for 4 expect 0
pred test11 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->2 + Queen3->3
col = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test11 for 4 expect 0
pred test35 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->2 + Queen3->3
col = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->1
nothreat[Queen3,Queen2]
}
}
run test35 for 4 expect 1
