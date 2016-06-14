

type
    Expression = ref object of RootObj
    Literal    = ref object of Expression
        x : int
    PlusExpr   = ref object of Expression
        a, b : Expression

method eval(e: Expression) : int {.base.} =
    quit "must override"

method eval(e: Literal) : int = return e.x

method eval(e: PlusExpr) : int =
    result = eval(e.a) + eval(e.b)

proc newList(x: int) : Literal =
    new(result)
    result.x = x

proc newPlus(a, b : Expression) : PlusExpr =
    new(result)
    result.a = a
    result.b = b

echo eval(newPlus(newPlus(newList(1), newList(2)), newList(4)))