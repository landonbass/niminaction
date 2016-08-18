
type
    Comparable = concept x, y
        (x < y) is bool

    Container[T] = concept c 
        c.len is Ordinal
        items(c) is T
        for value in c:
            type(value) is T

    p = tuple[x, y: int]



type Countable = concept c
    inc c
    dec c

proc countableEx(a: Countable) : Countable =
    result = a
    inc result
    inc result
    dec result

echo countableEx(2)

let x : p = (x:1, y:2)
let a = [1,2,3]

echo p is Comparable           #true
echo Container is Comparable   #false
echo p is Container            #false
echo x is Container            #false
echo a is Container            #true

