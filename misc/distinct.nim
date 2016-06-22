
type
    F = distinct float
    C = distinct float

proc `*`  (a, b: F)        : F      {.borrow.}
proc `+`  (a, b: F)        : F      {.borrow.}
proc `-`  (a, b: F)        : F      {.borrow.}
proc `-`  (a : F, b: float): float  {.borrow.}
proc `$`  (a:    F)        : string {.borrow.}
proc `==` (a, b: F)        : bool   {.borrow.}

proc `*`  (a, b: C)        : C      {.borrow.}
proc `+`  (a, b: C)        : C      {.borrow.}
proc `-`  (a, b: C)        : C      {.borrow.}
proc `$`  (a:    C)        : string {.borrow.}
proc `==` (a, b: C)        : bool   {.borrow.}

let d1 : F = 100.F
let d2 : C = 25.C

let d3 = d1 + 10.F

assert(d3 == 110.F)
assert(d2 == (5.C * 5.C))
