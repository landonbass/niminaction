
import asyncdispatch, asyncnet

type
    Client = ref object
        socket : AsyncSocket