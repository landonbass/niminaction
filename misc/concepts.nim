
type
    Comparable = concept x, y
        (x < y) is bool

    Container[T] = concept c 
        c.len is Ordinal
        items(c) is T
        for value in c:
            type(value) is T

    p = tuple[x, y: int]

let x : p = (x:1, y:2)
let a = [1,2,3]

echo p is Comparable           #true
echo Container is Comparable   #false
echo p is Container            #false
echo x is Container            #false
echo a is Container            #true

