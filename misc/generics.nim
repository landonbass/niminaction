
proc max[T: int | float](a, b: T) : T =
    if a < b:
        return b
    return a

doAssert max(1,2) == 2
doAssert max(2.0, 1.0) == 2.0 

type
    Container[T] = object
        empty: bool
        value: T
        
proc initContainer[T]() : Container[T] =
    result.empty = true


var box = initContainer[string]()
