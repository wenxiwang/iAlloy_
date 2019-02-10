module unknown
open util/integer [] as integer
abstract sig Listing {}
sig Address extends Listing {}
sig Name extends Listing {}
sig Book {
entry: (set Name),
listed: (entry->Listing)
}

fun lookup[b: Book,n: Name] : (set Listing) {
(n.(^(b.listed)))
}
fact fact_1 {
(all b: (one Book) {
(all n: (one (b.entry)) {
(some (n.(b.listed)))
})
})
}
fact fact_2 {
(all b: (one Book) {
(all n,l: (one Name) {
((l in (lookup[b,n])) => (l in (b.entry)))
})
})
}
fact fact_3 {
(all b: (one Book) {
(all n: (one (b.entry)) {
(!(n in (lookup[b,n])))
})
})
}
assert lookupEndsInAddr {
(all b: (one Book) {
(all n: (one (b.entry)) {
(some ((lookup[b,n]) & Address))
})
})
}

check lookupEndsInAddr for 7