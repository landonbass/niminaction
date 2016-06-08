import asyncdispatch, database, jester, times, views/user, views/general

let db = newDatabase()

proc userLogin(db: Database, request: Request, user: var User) : bool =
    if request.cookies.hasKey("username"):
        if not db.findUser(request.cookies["username"], user):
            user = User(username: request.cookies["username"], following: @[])
            db.create(user)
        return true
    return false

routes:
    get "/":
        var user: User
        if db.userLogin(request, user):
            let messages = db.findMessages(user.following & user.username)
            resp renderMain(renderTimeline(user.username, messages))
        else:
            resp renderMain(renderLogin())
    get "/@name":
        cond '.' notin @"name"
        var user: User
        if not db.findUser(@"name", user):
            halt "user not found"
        let messages = db.findMessages(@[user.username])

        var currentUser: User
        if db.userLogin(request, currentUser):
            resp renderMain(renderUser(user, currentUser) & renderMessages(messages))
        else:
            resp renderMain(renderUser(user) & renderMessages(messages))
    post "/login":
        setCookie("username", @"username", getTime().getGMTime() + 30.minutes)
        redirect("/")
    post "/createMessage":
        let message = Message(username: @"username", time: getTime(), msg: @"message")
        db.post(message)
        redirect("/")
    post "/follow":
        var follower, target: User
        if not db.findUser(@"follower", follower):
            halt "follower not found"
        if not db.findUser(@"target", target):
            halt "follow target not found"
 
        db.follow(follower, target)
        redirect(uri("/" & @"target")) 

runForever()