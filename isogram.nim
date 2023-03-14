import std/strutils
proc isIsogram*(input: string): bool =
    let inp = input.toLower().replace(" ", "").replace("-", "")
    for i in 0..<inp.len()-1:
        if inp[i] in inp[i+1..^1]:
            return false
    return true