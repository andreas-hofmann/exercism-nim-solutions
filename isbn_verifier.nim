import std/sequtils
import std/strutils

proc isValid*(isbn: string): bool =
    var toCheck = isbn.strip().filterIt(it != '-')
    if toCheck.len != 10:
        return false

    if toCheck[^1] == 'X':
        toCheck[^1] = char(ord('9')+1)

    let nr = toCheck.mapIt(it.int - ord('0'))
    if nr.anyIt(it < 0 or it > 10):
        return false

    var acc = 0
    for i in 0..9:
        acc += nr[i] * (10-i)
    acc mod 11 == 0