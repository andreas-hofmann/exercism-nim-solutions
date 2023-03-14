import std/strutils
import std/sequtils

proc clean*(nr: string): string =
    if nr.anyIt(it.isAlphaAscii):
        raise newException(ValueError, "Invalid chars")

    result = nr.filterIt(it.isDigit).join("")
    let l = result.len

    if l <= 9 or l > 11:
        raise newException(ValueError, "Too short")

    if l == 11:
        if result[0] != '1':
            raise newException(ValueError, "Invalid country code")
        else:
            result = result[1..^1]

    if l >= 10:
        let exchg = result[0]
        let area = result[3]
        if exchg == '0' or exchg == '1':
            raise newException(ValueError, "Invalid exchange code")
        if area == '0' or area == '1':
            raise newException(ValueError, "Invalid area code")
    elif l == 7:
        let area = result[0]
        if area == '0' or area == '1':
            raise newException(ValueError, "Invalid area code")