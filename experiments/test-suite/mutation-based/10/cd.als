pred test13 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
no ext
Acyclic[]
}}
}
run test13 for 3 expect 1
pred test14 {
some disj Object0: Object {some disj Object0: Class {
Object = Object0
Class = Object0
no ext
Acyclic[]
}}
}
run test14 for 3 expect 1
