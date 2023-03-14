import std/sequtils
import std/strutils

proc encrypt*(message: string): string =
    var
        msg = message.toLower().filterIt(it.isAlphaNumeric).join("")
        l = len msg
        c = l
        r = l

    while true:
        if c <= 0 or r <= 0:
            break
        if c == r:
            if (r-1)*c < l:
                break
            dec r
        else:
            if r*(c-1) < l:
                break
            dec c
    
    l = r*c

    while msg.len < l:
        msg.add " "

    for i in 0..<c:
        for j in 0..<r:
            result.add msg[i+c*j]
        if i < c-1: result.add " "
    