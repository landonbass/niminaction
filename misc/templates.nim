import os

template repeat(statements: untyped): untyped =
    while true:
        statements

var i: int= 0
repeat:
    echo i
    if i > 2: break
    sleep(1000)
    inc i

template declareVar(varName: untyped, value: typed) : untyped =
    var varName = value

declareVar(foo, 42)
echo foo

template hygiene(varName: untyped) : untyped =
    var varName = 42
    var notInjected = 100
    var injected {.inject.} = notInjected + 2

hygiene(injectedImplicitly)
doAssert(injectedImplicitly == 42)
doAssert(injected == 102)