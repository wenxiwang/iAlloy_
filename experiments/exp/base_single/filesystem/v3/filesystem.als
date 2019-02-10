module chapter4/filesystem
open util/integer [] as integer
abstract sig Object {}
sig Dir extends Object {
contents: (one Object)
}
one sig Root extends Dir {}
one sig File extends Object {}


fact fact_1 {
(Object in (Root.(*contents)))
}
assert SomeDir {
(all o: (one (Object - Root)) {
(some (contents.o))
})
}
assert RootTop {
(no o: (one Object) {
(Root in (o.contents))
})
}
assert FileInDir {
(all f: (one File) {
(some (contents.f))
})
}

check SomeDir
check RootTop
check FileInDir