import macros

macro addEcho(s: untyped): stmt =
    s.body.add(newCall("echo", newStrLitNode("OK")))
    result = s

proc f1() {.addEcho.} =
    let i = 1 + 2
    echo i

f1()