import std/math

type Colors* = enum
        Black = 0,
        Brown = 1,
        Red = 2,
        Orange = 3,
        Yellow = 4,
        Green = 5,
        Blue = 6,
        Violet = 7,
        Grey = 8,
        White = 9

func colorCode(c: Colors): int = int c

proc label*(vals: openarray[Colors]): (int, string) =
    let
        mult = 10.float.pow vals[2].float
    var
        nr = mult.int * (colorCode(vals[0])*10 + colorCode(vals[1]))
        mag = 0

    while nr.mod(1000*(mag+1)) == 0: inc mag
    if mag > 1: dec mag
    for _ in 0..<mag: nr = nr div 1000

    let lbl = case mag:
        of 0: "ohms"
        of 1: "kiloohms"
        of 2: "megaohms"
        of 3: "gigaohms"
        else: raise newException(ValueError, "Invalid label")

    (nr, lbl)