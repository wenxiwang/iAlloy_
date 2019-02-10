module appendixA/properties
open util/integer [] as integer

pred show[] {
(some r: (univ->univ) {
((some r) && ((r.r) in r) && (no (iden & r)) && ((~r) in r) && (((~r).r) in iden) && ((r.(~r)) in iden) && (univ in (r.univ)) && (univ in (univ.r)))
})
}


assert ReformulateNonEmptinessOK {
(all r: (univ->univ) {
((some r) <=> (some x,y: (one univ) {
((x->y) in r)
}))
})
}
run show for 50
check ReformulateNonEmptinessOK for 80