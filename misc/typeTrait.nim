import typetraits


template myAdd[L,R](lhs: L, rhs: R): auto =
    lhs + rhs

var intAndFloat = myAdd(5, 5.0)

echo $intAndFloat & " is " & intAndFloat.type.name

var a: int64 = 5
var b: int32 = 5
var int64Andint32 = myadd(a, b)

echo $int64Andint32 & " is " & int64Andint32.type.name
