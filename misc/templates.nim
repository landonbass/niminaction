import os

template repeat(statements: untyped): untyped =
    while true:
        statements

var i: int= 0
repeat:
    echo i
    sleep(1000)
    inc i

