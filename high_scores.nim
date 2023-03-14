import std/algorithm

proc latest*(scores: seq[int]): int =
    scores[^1]

proc personalBest*(scores: seq[int]): int =
    scores.sorted.reversed[0]

proc personalTopThree*(scores: seq[int]): seq[int] =
    var m = scores.len - 1
    if m > 2: m = 2
    scores.sorted.reversed[0..m]