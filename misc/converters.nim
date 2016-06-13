

converter toBool(x: int) : bool = x != 0

if 3: echo "compiles"

type
    TaskStatus = enum
        Inactive,
        Active 
    Task = ref object
        Status: TaskStatus

converter isTaskValid(task: Task) : bool = task.Status == TaskStatus.Active

let task1 = Task(Status: TaskStatus.Active)
let task2 = Task(Status: TaskStatus.Inactive)

if task1: echo "task1 is valid"
if task2: echo "task2 is valid"