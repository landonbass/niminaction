import times, threadpool;
{.experimental.}

proc enumerableRepeat[T](value: T, n: int = -1): iterator(): T =
    result = iterator(): T {.closure.} =
        var i = 0
        while n == -1 or i < n:
            yield value
            i += 1

proc writeFile[T](filePath: string, iter: iterator():T) =
    var file = open(filePath, mode=fmWrite)
    for str in iter(): file.writeLine(str)
    file.close()

var w = ["aaa", "bbb", "ccc"]
var startTime = epochTime()
parallel:
    for i, str in w:
        spawn writeFile("dict" & $i & ".dat", enumerableRepeat(str, 3_000_000))

echo "time: ", epochTime() - startTime, "seconds"