import std/strutils

type Queen* = object
    col*: int
    row*: int

proc initQueen*(r, c: int): Queen =
    if c < 0 or r < 0:
        raise newException(ValueError, "Negative coords")
    if c > 7 or r > 7:
        raise newException(ValueError, "Too large coords")
    Queen(col: c, row: r)

proc canAttack*(w, b: Queen): bool =
    if w == b:
        raise newException(ValueError, "Identical queens")
    if w.col == b.col or w.row == b.row:
        return true
    if abs(w.col - b.col) == abs(w.row - b.row):
        return true
    return false

proc board*(w, b: Queen): string =
    if w == b:
        raise newException(ValueError, "Identical queens")
    result = "________\n".repeat(8)
    result[9*w.row+w.col] = 'W'
    result[9*b.row+b.col] = 'B'