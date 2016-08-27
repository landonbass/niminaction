import macros

macro addEcho(s: untyped): stmt =
    s.body.add(newCall("echo", newStrLitNode("OK")))
    result = s

proc f1() {.addEcho.} =
    let i = 1 + 2
    echo i

f1()

dumpTree:
    5 * (5 + 10)

static:
    var root = newStmtList (
        infix (
            newIntLitNode(5),
            "*",
            newPar(
                infix(
                    newIntLitNode(5),
                    "+",
                    newIntLitNode(10)
                )
            )
        )
    )

    echo root.repr

