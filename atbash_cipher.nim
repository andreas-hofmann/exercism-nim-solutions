import std/strutils
import std/sequtils

proc encode*(msg: string): string =
    var i = 0
    for c in msg.toLower().filterIt(it.isAlphaNumeric()):
        if c.isAlphaAscii: result.add (ord('z')-(ord(c)-ord('a'))).chr()
        else: result.add c
        inc i
        if i mod 5 == 0: result.add ' '
    result.strip()

proc decode*(msg: string): string =
    encode(msg).filterIt(it != ' ').join("")