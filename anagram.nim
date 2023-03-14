import std/algorithm
import std/strutils

func detectAnagrams*(word: string, candidates: openarray[string]): seq[string] =
    let lw = word.toLower()
    let sw = lw.sorted()
    for c in candidates:
        let lc = c.toLower()
        if lc.sorted() == sw and lc != lw: result.add c