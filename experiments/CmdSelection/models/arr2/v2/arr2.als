sig Element {}

one sig Array {
  i2e: Int -> Element,
  length: Int
}

// Assume all objects are in the array.
fact Reachable {
  Element = Array.i2e[Int]
}

fact InBound {
  all i:Array.i2e.Element | i >= 0
  all i:Array.i2e.Element | i < Array.length
  Array.length = #Element
}

pred NoConflict() {
  all i:Array.i2e.Element | #Array.i2e[i] = 1
}

run NoConflict for 400
