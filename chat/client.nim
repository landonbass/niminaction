import asyncdispatch, asyncnet, os, threadpool
import protocol

proc connect(socket: AsyncSocket, serverAddr: string) {.async.} =
    echo "connecting to " & serverAddr
    await socket.connect(serverAddr, 7687.Port)
    echo "connected"

    while true:
        let line = await socket.recvLine()
        let parsed = parseMessage(line)
        echo parsed.username & " said " & parsed.message

echo "chat initialized"

if paramCount() == 0:
    quit "please specift server address and username"

let serverAddr = paramStr(1)
let username   = paramStr(2)
var socket     = newAsyncSocket()
asyncCheck connect(socket, serverAddr)

var messageFlowVar = spawn stdin.readLine()
while true:
    if messageFlowVar.isReady():
        let message = createMessage(username, ^messageFlowVar)
        asyncCheck socket.send(message)
        messageFlowVar = spawn stdin.readLine()

    asyncdispatch.poll()