proc isPrime(nr: int): bool =
    if nr < 2: return false
    if nr == 2: return true
    for i in 2..<nr:
        if nr.mod(i) == 0:
            return false
    return true

proc prime*(nr: int): int =
    if nr <= 0: raise newException(ValueError, "No valid nr")
    var
        i = 1
        cnt = 0
    while true:
        inc i
        if i.isPrime:
            inc cnt
            if cnt == nr:
                return i