proc isPrime(nr: int64): bool =
    for i in 2..<nr:
        if (nr div i) > 0 and (nr mod i) == 0:
            return false
    return true

proc primeFactors*(nr: int64): seq[int] =
    var candidate = nr
    while candidate != 1:
        for i in 2..nr:
            if (candidate mod i) == 0 and isPrime i:
                result.add i.int
                candidate = candidate div i
                break