
proc printf(format: cstring): cint {.importc, varargs.}
discard printf("my name is %s and I am %d years old.\n", "Landon", 33)

type
    CTime = int64

proc time(arg: ptr CTime) : CTime {.importc, header: "<time.h>".}

type
    TM {.importc: "struct tm", header:"<time.h>".} = object
        tm_min  : cint
        tm_hour : cint

proc localtime(time: ptr CTime): ptr TM {.importc, header:"<time.h>".}

var seconds = time(nil)
let tm = localtime(addr seconds)

#cannot use echo if you define printf
#echo(tm.tm_hour, ":", tm.tm_min)

discard printf("%d:%d\n", tm.tm_hour, tm.tm_min)
