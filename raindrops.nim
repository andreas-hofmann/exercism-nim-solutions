proc convert*(nr: int): string =
    if nr.mod(3) == 0: result &= "Pling"
    if nr.mod(5) == 0: result &= "Plang"
    if nr.mod(7) == 0: result &= "Plong"
    if result.len == 0: result = $nr