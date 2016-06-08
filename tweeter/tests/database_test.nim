import database, os, times

when isMainModule:
    removeFile("tweeter_test.db")

    var db = newDatabase("tweeter_test.db")
    db.setup()

    db.create(User(username: "landonbass"))
    db.create(User(username: "johndoe"))

    db.post(Message(username: "landonbass", time: getTime() + 4.seconds, msg: "hello world"))
    db.post(Message(username: "johndoe", time: getTime() + 2.seconds, msg: "hello at you"))

    var landon, john: User

    doAssert db.findUser("landonbass", landon)
    doAssert db.findUser("johndoe", john)

    db.follow(landon, john)

    doAssert db.findUser("landonbass", landon)

    let messages = db.findMessages(landon.following)

    doAssert(messages[0].msg == "hello at you")

    echo "all database tests successful"