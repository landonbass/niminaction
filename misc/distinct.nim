
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

converter toC (f: float) : C = f.C
#converter toC (f: F)     : C = (f - 32) * 5/9
#converter toF (c: C) : F = c * (9/5) + 32

let d1 = 100.F
let d2 = 25.C

let d3 = d1 + 10.F

assert(d3 == 110.F)

echo $d3

assert(d2 == (5.C * 5.C))
echo $(d1.C)

