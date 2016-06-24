

import threadpool, os

let lineFlowVar = spawn stdin.readLine()
while not lineFlowVar.isReady:
    echo "no input detected, will wait 2 seconds"
    sleep 2000

echo ^lineFlowVar