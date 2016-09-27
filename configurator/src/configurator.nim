import macros



proc createRefType(ident: NimIdent, identDefs: seq[NimNode]): NimNode =
    result = newNimNode(nnkTypeSection).add(
        newNimNode(nnkTypeDef).add(
            newIdentNode(ident),
            newEmptyNode(),
            newNimNode(nnkRefTy).add(
                newNimNode(nnkObjectTy).add(
                newEmptyNode(),
                newEmptyNode(),
                newNimNode(nnkRecList).add(
                    identDefs
                )
            )
        )
    ))

proc toIdentDefs(stmtList: NimNode): seq[NimNode] =
    expectKind(stmtList, nnkStmtList)
    result = @[]
    for child in stmtList:
        expectKind(child, nnkCall)
        result.add(
            newIdentDefs(
                child[0],
                child[1][0]
            )
        )
   
template constructor(ident: untyped) : untyped =
    proc `new ident`(): `ident` =
        new result

macro config(typeName: untyped, fields: untyped): untyped =
    result = newStmtList()
    let identDefs = toIdentDefs(fields)
    result.add createRefType(typeName.ident, identDefs)
    echo treeRepr(typeName)
    echo treeRepr(fields)
    echo treeRepr(result)
    
config MyAppConfig:
    address: string
    port   : int

dumpTree:
    type 
        MyAppConfig = ref object
            address: string
            port: int

proc newMyAppConfig() : MyAppConfig =
    new result

proc load*(cfg: MyAppConfig, filename: string) =
    var obj     = parseFile(filename)
    cfg.address = obj["address"].getStr
    cfg.port    = obj["port"].getNum.int