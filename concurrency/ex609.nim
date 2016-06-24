

import threadpool, os

proc crash(): string =
    raise newException(Exception, "crash")

proc catchCrash(): string =
    try:
        raise newException(Exception, "crash again")
    except:
        echo "caught exception"

let lineFlowVar2 = spawn catchCrash()
sleep 2000
let lineFlowVar = spawn crash()
sync()
