
proc printf(format: cstring): cint {.importc, varargs.}
discard printf("my name is %s and I am %d years old.\n", "Landon", 33)

