#? stdtmpl(subsChar = '$', metaChar = '#', toString = "xmltree.escape")
#
#import "../database"
#import times, xmltree
#
#proc renderUser*(user: User): string =
# result = ""
<div id="user">
    <h1>${user.username}</h1>
    <span>${$user.following.len}</span>
</div>
#end proc
#
#proc renderUser*(user, currentUser: User): string =
# result = ""
<div id="user">
    <h1>${user.username}</h1>
    <span>${$user.following.len}</span>
    #if user.username notin currentUser.following:
    <form action="follow" method="post">
        <input type="hidden" name="follower" value="${currentUser.username}">
        <input type="hidden" name="target" value="${user.username}">
        <input type="submit" value="follow">
    </form>
    #end if
</div>
#end proc
#
#proc renderMessages*(messages:seq[Message]): string =
#   result = ""
<div id="messages">
    #for message in messages:
        <div>
            <a href="/${message.username}">${message.username}</a>
            <span>${message.time.getGMTime().format("HH:mm MMMM d',' yyyy")}</span>
            <h3>${message.msg}</h3>
        </div>
    #end for
</div>
#end proc
#
#when isMainModule:
# echo renderUser(User(username: "landonbass", following: @["johndoe"]))
# echo renderUser(User(username: "landonbass", following: @["johndoe"]), User(username: "johndoe", following: @["notlandon"]))
#
# echo renderMessages(@[
#   Message(username: "landonbass", time: getTime(), msg: "test message 1"),
#   Message(username: "landonbass", time: getTime(), msg: "test message 1")
#])
#end when