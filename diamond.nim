import std/strutils

func row(letter: char, length: int): string =
    result =  ' '.repeat(length).join ""

    let
        l = len result
        mid = int l/2
        off = ord(letter) - ord('A')

    result[mid-off] = letter
    result[mid+off] = letter
    result.add '\n'

func diamond*(letter: char): string =
    let
        ltrCount = ord(letter) - ord('A')
        lineLen = 1+ltrCount*2

    for ltr in countup(0, ltrCount):
        result = result & row( chr(ltr + ord 'A'), lineLen )
    for ltr in countdown(ltrCount-1, 0):
        result = result & row( chr(ltr + ord 'A'), lineLen )