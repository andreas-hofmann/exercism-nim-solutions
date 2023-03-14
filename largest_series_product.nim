import std/sequtils
import std/strutils

proc largestProduct*(nr: string, span: int): int =
    if span < 0 or span > len nr:
        raise newException(ValueError, "Not enough digits")
    if nr.anyIt(not it.isDigit):
        raise newException(ValueError, "Non-digit found")
    if nr.len == 0 or span == 0:
        return 1

    let numbers = nr.mapIt(it.int - ord('0'))
    result = -1
    for i in 0..numbers.len-span:
        var sum = 1
        for j in 0..<span:
            sum *= numbers[i+j]
        if sum > result: result = sum

    if result == -1:
        return 0