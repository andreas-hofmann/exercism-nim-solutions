import std/strutils

proc score*(word: string): int =
    for c in word.toUpper():
        result.inc case c:
            of 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T': 1
            of 'D', 'G': 2
            of 'B', 'C', 'M', 'P': 3
            of 'F', 'H', 'V', 'W', 'Y': 4
            of 'K': 5
            of 'J', 'X': 8
            of 'Q', 'Z': 10
            else: 0