import std/strutils
import std/math

func isArmstrongNumber*(nr: int): bool =
    let
        n = nr.intToStr()
        exp = len(n).float()
    var toTest = 0
    for d in n:
        toTest += parseInt($d).float().pow(exp).int()
    return toTest == nr