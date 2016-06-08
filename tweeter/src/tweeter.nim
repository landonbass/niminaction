import asyncdispatch, jester

routes:
    get "/":
        resp "hello world"

runForever()