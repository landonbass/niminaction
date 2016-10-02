

proc scroll[T](a: var openarray[T]; d : int) =
    if d == 0: discard
    elif abs(d) >= a.len:
        for el in a.mitems : el.reset
    elif d > 0:
        for i in countdown(a.len-1, d):
            a[i] = a[i-d]
        for j in 0..<d: a[j].reset
    elif d < 0:
        for i in -d..<a.len:
            a[i+d]=a[i]
        for j in countdown(-d, 1): a[^j].reset

var a = [1,2,3]
scroll(a, 1)
echo a[0]
echo a[1]
echo a[2]

