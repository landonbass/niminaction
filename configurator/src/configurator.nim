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

            