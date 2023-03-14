import std/parseutils
import std/sequtils
import std/strutils

proc encode*(msg: string): string =
    var
        cnt = 0
        chr = char(0)
    for c in msg & $char(0):
        if c != chr:
            if cnt > 1:
                result &= $cnt
            if cnt > 0:
                result &= $chr
            cnt = 1
            chr = c
        else:
            inc cnt

proc decode*(msg: string): string =
    var
        i = 0
        cnt = 0
    while i < msg.len:
        let l = parseInt(msg, cnt, i)
        if l == 0:
            result &= $msg[i]
            inc i
        else:
            i.inc l
            result &= msg[i].repeat(cnt-1).join("")
