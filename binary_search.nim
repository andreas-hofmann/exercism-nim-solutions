proc binarySearch*(a: openArray[int], val: int): int =
  if val notin a:
    return -1

  let mid = (a.len/2).int

  if val == a[mid]:
    return mid

  if val > a[mid]:
    return mid+binarySearch(a[mid..a.high], val)
  else:
    return binarySearch(a[a.low..<mid], val)