
proc max[T](a, b: T) : T =
    if a < b:
        return b
    return a

doAssert max(1,2) == 2
doAssert max(2.0, 1.0) == 2.0 

