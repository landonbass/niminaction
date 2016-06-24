
var data = "hello world"

proc countData(param: string) {.thread.} =
    for i in 0 .. <param.len:
        stdout.write($i)
    echo()

const threadCount = 2;
var threads: array[threadCount, Thread[string]]
for i in 0 .. <threadCount:
    createThread[string](threads[i], countData, data)
joinThreads(threads)
