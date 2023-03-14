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

func colors*(): seq[Colors] =
    for c in Colors: result.add c

func colorCode*(c: Colors): int = int c