import std/math

proc score*(coords: (float, float)): int =
    let dist = sqrt( coords[0].pow(2) + coords[1].pow(2) )
    if dist > 10.0: 0
    elif dist > 5.0: 1
    elif dist > 1.0: 5
    else: 10