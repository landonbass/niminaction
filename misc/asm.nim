
{.push stackTrace:off.}
proc addInt(a, b: int) : int =
    asm """
       mov eax, `a`
       add eax, `b`
       jno theEnd
       call `raiseOverflow`
       theEnd:
    """
{.pop.}

echo addInt(2, 3) #errors