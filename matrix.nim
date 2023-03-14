import std/[strutils, sequtils]

proc row*(m: string, r: int): seq[int] =
    m.splitLines[r-1].split(" ").mapIt(parseInt it)

proc column*(m: string, c: int): seq[int] =
    for col in m.splitlines: result.add col.split(" ").mapIt(parseInt it)[c-1]