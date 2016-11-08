import future

proc passTwoAndTwo(f: (int, int) -> int) : int =
    f(2, 2)

echo passTwoAndTwo((x, y) => x + y)

echo lc[ x | (x <- 1..10, x mod 2 == 0), int]
