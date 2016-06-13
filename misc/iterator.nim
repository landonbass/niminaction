

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