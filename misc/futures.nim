import future

proc passTwoAndTwo(f: (int, int) -> int) : int =
    f(2, 2)

echo passTwoAndTwo((x, y) => x + y)