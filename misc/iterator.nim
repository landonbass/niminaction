

type
    Task = ref object
        Title: string

iterator GetTasks(count:int) : Task =
    var i = 0
    while i < count:
        yield Task(Title: "Task " & $i)
        inc i

for task in GetTasks(10):
    echo task.Title

iterator count(): int {.closure.} =
    var x = 1
    yield x
    inc x
    yield x

proc invoke(iter: iterator(): int {.closure.}) =
    for x in iter(): echo x

invoke count