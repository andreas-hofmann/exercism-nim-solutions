import std/tables
import std/strutils

proc transform*(input: Table[int, seq[char]]): Table[char, int] =
    for k, v in input:
        for c in v:
            result.add tolower($c)[0], k