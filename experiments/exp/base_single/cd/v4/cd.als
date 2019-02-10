module unknown
open util/integer [] as integer
sig Class {
ext: (lone Class)
}
lone sig Object extends Class {}
pred ObjectNoExt[] {
(no (Object.ext))
}
pred Acyclic[] {
(all c: (one Class) {
(c !in (c.(^ext)))
})
}
pred AllExtObject[] {

}
pred ClassHierarchy[] {
((ObjectNoExt[]) && (Acyclic[]) && (AllExtObject[]))
}



run ObjectNoExt for 200
run Acyclic for 50
run AllExtObject for 100
run ClassHierarchy for 40
