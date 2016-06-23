#prevent sql injection

import strutils, sequtils

type
    SQL = distinct string

proc `$` (sql: SQL) : string {.borrow.}

proc properQuote(s: string) : SQL =
    return SQL(s)

proc `%` (frmt: SQL, values: openarray[string]): SQL =
    let v = values.mapIt(SQL, properQuote(it))
    type StrSeq = seq[string]
    result = SQL(string(frmt) % StrSeq(v))

let sql = "SELECT * FROM users WHERE name = '$1'".SQL

let username = "'bobbytables'; drop table users;--" #looks like ' is not handled

echo $(sql % [username])




