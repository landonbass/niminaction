

converter toBool(x: int) : bool = x != 0

if 3: echo "compiles"

type
    TaskStatus = enum
        Inactive,
        Active 
    Task = ref object
        Status: TaskStatus
        Title: string

converter isTaskValid(task: Task) : bool = task.Status == TaskStatus.Active

#it appears that only the first converter is used, this will not execute, or if it does is overwritten
#if the first task converter is commented out, this will execute
converter isTaskStillValid(task: Task) : bool = task.Title == "task 2"


let task1 = Task(Status: TaskStatus.Active,   Title: "task 1")
let task2 = Task(Status: TaskStatus.Inactive, Title: "task 2")

if task1: echo "task1 is valid"
if task2: echo "task2 is valid"

type
    Element = enum
        A 
        B 
        C 

converter toInt*(x:Element) : int = x.int
var data = [1,2,3]

echo data[B.int]