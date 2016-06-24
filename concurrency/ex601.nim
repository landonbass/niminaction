
#will not compile as the child thread tries to access main thread's data

var data = "hello world"

proc showData() {.thread.} =
    echo data

var thread : Thread[void]
createThread[void](thread, showData)
joinThread thread