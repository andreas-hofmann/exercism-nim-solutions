proc slices*(s: string, n: int): seq[string] =
  if n <= 0 or n > s.len:
    raise newException(ValueError,"invalid substing length")
  var i = 0
  while i <= high(s):
    try:
      result.add s[i..<i+n]
    except:
      discard
    inc i
