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

func colorCode*(c: Colors): int = int c

func value*(vals: openarray[Colors]): int =
    colorCode(vals[0])*10 + colorCode(vals[1])