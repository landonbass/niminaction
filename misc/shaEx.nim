import nimSHA2, os, strutils

proc main(): string =
   const blockSize = 8192
   var bytesRead: int = 0
   var buffer: string
   
   var f: File = open("./misc/shaEx.nim")
   var sha: SHA256
   sha.initSHA()
   
   buffer = newString(blockSize)
   bytesRead = f.readBuffer(buffer[0].addr, blockSize)
   setLen(buffer,bytesRead)
   
   while bytesRead > 0:
     echo bytesRead
     sha.update(buffer)
     
     setLen(buffer,blockSize)
     bytesRead = f.readBuffer(buffer[0].addr, blockSize)
     setLen(buffer,bytesRead)
   
   let digest = sha.final()
   
   result = digest.hex()


when isMainModule:
  echo main()