

var a: ptr int16

var t = @[1.int16, 2.int16, 3.int16]

proc `+`[T](a: ptr T, b: int): ptr T =
    if b >= 0:
        cast[ptr T](cast[uint](a) + cast[uint](b * a[].sizeof))
    else:
        cast[ptr T](cast[uint](a) - cast[uint](-1 * b * a[].sizeof))

template `-`[T](a: ptr T, b: int): ptr T = `+`(a, -b)

a = t[0].addr
echo a[]
a = a + 1
echo a[]
a = a + 1
echo a[]
a = a + -1
echo a[]
a = a - 1
echo a[]