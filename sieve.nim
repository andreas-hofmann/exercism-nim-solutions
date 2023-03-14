import std/sequtils

proc primes*(limit: int): seq[int] =
  var numbers = toSeq(2..limit)
  for i in low(numbers)..high(numbers):
    var j = i+1
    while j <= high(numbers):
      if numbers[j].mod(numbers[i]) == 0:
        numbers.delete(j)
      else:
        inc j
  return numbers

