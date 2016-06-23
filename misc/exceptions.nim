


try:
    raise newException(Exception, "oops")
except Exception:
    echo getCurrentExceptionMsg()
finally:
    echo "done"

proc testDefer() =
    defer: echo "done again"
    #raise newException(Exception, "oops again") #not handled

testDefer()