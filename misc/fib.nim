

proc fib(n: int64) =
    var first  = 0
    var second = 1
    echo first
    echo second
    for i in 0..<n:
        swap first, second
        second += first
        echo second

fib 90