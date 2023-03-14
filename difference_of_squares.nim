import std/math

proc squareOfSum*(nr: int): int =
    var sum = 0
    for i in 1..nr:
        sum += i
    return sum*sum

proc sumOfSquares*(nr: int): int =
    for i in 1..nr:
        result += i*i

proc difference*(nr: int): int =
    return abs(sumOfSquares(nr) - squareOfSum(nr))