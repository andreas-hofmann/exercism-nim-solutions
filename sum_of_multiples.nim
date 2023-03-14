proc sum*(nr: int, multiples: seq[int]): int =
    var counted = newSeq[int]()
    for n in 1..<nr:
        for m in multiples:
            if m != 0 and n mod m == 0 and not (n in counted):
                result += n
                counted.add(n)