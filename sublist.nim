import std/sequtils

type
  Comparison* = enum
    Unequal, Sublist, Superlist, Equal

proc contains[T](a, b: seq[T]): bool =
  if b == []:
    return true

  for i in low(a)..high(a)-(b.len-1):
    for j in low(b)..high(b):
      if a[i+j] != b[j]:
        break
      if j == high(b):
        return true

  return false

proc sublist*(a, b: openArray[int]): Comparison =
  let
    sa = a.toSeq
    sb = b.toSeq

  if sa == sb:
    return Equal

  if sa.contains(sb):
    return Superlist

  if sb.contains(sa):
    return Sublist

  return Unequal