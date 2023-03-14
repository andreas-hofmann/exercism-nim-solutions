import std/math

type Classification* = enum Perfect, Abundant, Deficient

func classify*(nr: int): Classification =
    if nr <= 0: raise newException(ValueError, "Invalid nr")
    if nr == 1: return Deficient

    var factors = @[1]
    for i in 2..<nr:
        if (nr mod i) == 0:
            factors.add i

    let s = sum factors
    if s == nr: Perfect
    elif s < nr: Deficient
    else: Abundant