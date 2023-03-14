func steps*(start: int): int =
    if start < 1: raise new ValueError
    var nr = start
    while nr != 1:
        if nr mod 2 == 0: nr = nr div 2 else: nr = nr*3 + 1
        inc(result)