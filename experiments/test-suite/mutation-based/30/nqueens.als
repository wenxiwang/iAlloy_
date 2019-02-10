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
pred test51 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->1 + Queen2->1 + Queen3->0
col = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test51 for 4 expect 1
pred test74 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->3
}
}
run test74 for 4 expect 0
pred test44 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->0
col = Queen0->3 + Queen1->3 + Queen2->1 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test44 for 4 expect 1
pred test40 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->1 + Queen2->2 + Queen3->0
col = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->1
nothreat[Queen3,Queen2]
}
}
run test40 for 4 expect 1
pred test6 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->-7 + Queen1->1 + Queen1->6 + Queen2->-7 + Queen2->0 + Queen2->2 + Queen2->5
col = Queen0->1 + Queen1->1 + Queen2->1
}
}
run test6 for 4 expect 0
pred test45 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->3
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test45 for 4 expect 1
pred test43 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->1 + Queen2->1 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test43 for 4 expect 0
pred test8 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
no col
}
}
run test8 for 4 expect 0
pred test10 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->0 + Queen3->0
col = Queen0->0 + Queen1->0 + Queen2->2 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test10 for 4 expect 0
pred test18 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->3 + Queen2->0 + Queen3->0
col = Queen0->3 + Queen1->1 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test18 for 4 expect 0
pred test49 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->0 + Queen1->2 + Queen2->0
col = Queen0->1 + Queen1->1 + Queen2->0
nothreat[Queen2,Queen1]
}
}
run test49 for 4 expect 1
pred test17 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->2 + Queen2->2 + Queen3->3
col = Queen0->0 + Queen1->0 + Queen2->0 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test17 for 4 expect 1
pred test31 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->2 + Queen2->2 + Queen3->1
col = Queen0->3 + Queen1->2 + Queen2->2 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test31 for 4 expect 1
pred test20 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->0 + Queen1->2 + Queen2->0
col = Queen0->2 + Queen1->0 + Queen2->1
nothreat[Queen2,Queen1]
}
}
run test20 for 4 expect 1
pred test15 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->1 + Queen2->2 + Queen3->1
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test15 for 4 expect 0
