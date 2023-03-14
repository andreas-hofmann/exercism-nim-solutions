proc roman*(n: int): string =
  var nr = n
  while nr >= 1000:
    result.add "M"
    nr.dec 1000

  while nr >= 100:
    if nr >= 900:
      result.add "CM"
      nr.dec 900
    elif nr >= 500:
      result.add "D"
      nr.dec 500
    elif nr >= 400:
      result.add "CD"
      nr.dec 400
    elif nr >= 100:
      result.add "C"
      nr.dec 100

  while nr >= 10:
    if nr >= 90:
      result.add "XC"
      nr.dec 90
    elif nr >= 50:
      result.add "L"
      nr.dec 50
    elif nr >= 40:
      result.add "XL"
      nr.dec 40
    elif nr >= 10:
      result.add "X"
      nr.dec 10

  while nr >= 1:
    if nr >= 9:
      result.add "IX"
      nr.dec 9
    elif nr >= 5:
      result.add "V"
      nr.dec 5
    elif nr >= 4:
      result.add "IV"
      nr.dec 4
    elif nr >= 1:
      result.add "I"
      nr.dec 1

