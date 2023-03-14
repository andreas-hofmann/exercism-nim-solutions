import std/math

func onSquare*(sq: int): uint64 =
    if sq notin 1..64:
        raise new ValueError
    pow(2.0, float(sq)-1).uint64()

func total*(): uint64 =
    for s in 1..64:
        result += onSquare(s)
