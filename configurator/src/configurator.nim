import macros

macro config(typeName: untyped, fields: untyped): untyped =
    result = newStmtList()
    echo treeRepr(typeName)
    echo treeRepr(fields)

config MyAppConfig:
    address: string
    port   : int

dumpTree:
    type 
        MyAppConfig = ref object
            address: string
            port: int


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