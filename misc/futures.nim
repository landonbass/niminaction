import future

proc passTwoAndTwo(f: (int, int) -> int) : int =
    f(2, 2)

echo passTwoAndTwo((x, y) => x + y)

echo lc[ x | (x <- 1..10, x mod 2 == 0), int]

type Person = ref object
    name : string
    age  : int

var p1 : Person = Person(name: "Landon", age: 33)
var p2 : Person = Person(name: "John", age: 31)

let people : seq[Person]= @[p1, p2]

# echo lc[ p | (p <- people, p.age > 32), Person]

