const magnitudes = [
  (100i64, "hundred"),
  (1_000i64, "thousand"),
  (1_000_000i64, "million"),
  (1_000_000_000i64, "billion"),
  (1_000_000_000_000i64, "trillion"),
]

proc doSay(n: int64): string =
  if n <= 13:
    return case n:
    of 0: ""
    of 1: "one"
    of 2: "two"
    of 3: "three"
    of 4: "four"
    of 5: "five"
    of 6: "six"
    of 7: "seven"
    of 8: "eight"
    of 9: "nine"
    of 10: "ten"
    of 11: "eleven"
    of 12: "twelve"
    of 13: "thirteen"
    else: ""
  elif n < 100:
    let tens = n div 10
    var ones = doSay(n mod 10)

    if ones.len > 0 and tens > 1:
      ones = "-" & ones

    return case tens:
    of 1: ones & "teen"
    of 2: "twenty" & ones
    of 3: "thirty" & ones
    of 4: "forty" & ones
    of 5: "fifty" & ones
    of 6: "sixty" & ones
    of 7: "seventy" & ones
    of 8: "eighty" & ones
    of 9: "ninety" & ones
    else: ""
  else:
    for m in magnitudes:
      if n >= m[0]:
        let cur = doSay(n div m[0])

        result =
          if cur.len > 0: cur & " " & m[1]
          else: ""

        let next = doSay(n mod m[0])
        if next.len > 0:
          result &= " " & next

proc say*(n: int64): string =
  if n notin 0..999_999_999_999:
    raise newException(ValueError, "out of range")

  if n == 0:
    return "zero"

  doSay n
