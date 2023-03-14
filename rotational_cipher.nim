import std/strutils
proc rotate*(msg: string, rot: int): string =
    var res = newSeq[char]()
    for c in msg:
        if c.isAlphaAscii:
            var base = ord('A')
            if c.isLowerAscii:
                base = ord('a')
            res.add char((c.int-base+rot).mod(26)+base)
        else:
            res.add c
    res.join("")