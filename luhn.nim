import std/sequtils
import std/strutils

proc isValid*(input: string): bool =
    let nr = input.filterIt(it != ' ')

    if nr.len < 2:
        return false
    if nr.anyIt(not it.isDigit):
        return false

    var ints = nr.mapIt(it.int - ord('0'))
    for i in 1 .. ints.len:
        if i mod 2 == 0:
            var new_nr = ints[^i] * 2
            if new_nr > 9:
                new_nr -= 9
            ints[^i] = new_nr

    var sum = 0
    for i in ints:
        sum.inc i
    0 == sum mod 10
