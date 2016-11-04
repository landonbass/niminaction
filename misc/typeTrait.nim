import typetraits


template myAdd[L,R](lhs: L, rhs: R): auto =
    lhs + rhs

var intAndFloat = myAdd(5, 5.0)

echo $intAndFloat & " is " & intAndFloat.type.name

