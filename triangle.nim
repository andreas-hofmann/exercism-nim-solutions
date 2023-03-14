import std/sequtils

func check(data: openarray[int]): bool =
    let
        a = data[0]
        b = data[1]
        c = data[2]
    return a + b >= c and
            b + c >= a and
            a + c >= b

proc isEquilateral*(data: openarray[int]): bool =
    data.deduplicate.len == 1 and data[0] != 0 and check(data)

proc isIsosceles*(data: openarray[int]): bool =
    data.deduplicate.len < 3 and data[0] != 0 and check(data)

proc isScalene*(data: openarray[int]): bool =
    data.deduplicate.len == 3 and check(data)