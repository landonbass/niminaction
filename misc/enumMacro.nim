import macros, strutils

macro def*(myEnum: untyped): untyped =
  result = newStmtList()
  add result, myEnum
  
  let name = myEnum[0][0][0]
  for item in myEnum[0][0][2]:
    if kind(item) != nnkIdent: continue
    
    let n = !toLowerAscii($item)
    add result, quote do:
      template `n`*(arg: typed): untyped =
        something(`name`.`item`, arg)
  

def:
  type Level = enum
    LOW
    HIGH

template something(level: Level, arg: untyped): untyped =
  $level & ": " & arg

echo low("No problems")
echo high("Hope is lost")