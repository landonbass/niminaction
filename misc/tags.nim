

type IO = object

proc readLine(): string {.tags: [IO].} =
    echo ""

proc no_IO() {.tags: [].} =
    #let x = readLine() #not allowed bc of tags
    echo 1

no_IO()
