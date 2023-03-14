import std/sequtils

proc convert*(nrs: openarray[int], ib, ob: int): seq[int] =
    if ib < 2 or ob < 2 or nrs.anyIt(it >= ib or it < 0):
        raise new ValueError
    var nr = 0
    var mag = 1
    for i in countdown(nrs.len-1, 0):
        inc nr, nrs[i]*mag
        mag *= ib
    mag = 1
    while nr != 0:
        let curdiv = ob*mag
        result.insert (nr mod curdiv), 0
        nr = nr div curdiv
    if result.len == 0:
        result.add 0