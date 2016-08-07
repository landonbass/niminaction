import future

proc addTwo(f: (int, int) -> int) : int =
    f(2, 2)

echo addTwo((x, y) => x + y)


