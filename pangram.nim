import std/strutils

proc isPangram*(input: string): bool =
    let i = input.toLower()
    for c in 'a'..'z':
        if c in i: continue
        else: return false
    return true