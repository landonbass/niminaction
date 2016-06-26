import os, threadpool

echo "chat initialized"

if paramCount() == 0:
    quit "please specift server address"

let serverAddr = paramStr(1)
echo "connecting to ", serverAddr

while true:
    let message = spwan stdin.readLine()
    echo ^message