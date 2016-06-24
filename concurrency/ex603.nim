
var data = "hello world"

proc showData(param: string) {.thread.} =
    echo param

var thread : Thread[string]
createThread[string](thread, showData, data)
joinThread thread

type
    ThreadData = object
        p1 : string
        p2 : int

proc showData2(data: ThreadData) {.thread.} =
    echo data.p1 & " " & $data.p2

var thread2: Thread[ThreadData]
createThread[ThreadData](thread2, showData2, ThreadData(p1: data, p2: 42))
joinThread thread2