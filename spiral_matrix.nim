type Direction = enum
  Right, Down, Left, Up

proc spiral*(n: static int): array[n, array[n, int]] =
  var
    i = 1
    d = 1
    pos = (0, 0)
    dir = Right
  while i <= n*n:
    result[pos[1]][pos[0]] = i
    inc i

    case dir:
    of Right:
      if pos[0] < (n-d):
        pos[0].inc
      else:
        pos[1].inc
        dir = Down
    of Down:
      if pos[1] < (n-d):
        pos[1].inc
      else:
        pos[0].dec
        dir = Left
    of Left:
      if pos[0] >= d:
        pos[0].dec
      else:
        pos[1].dec
        dir = Up
        inc d
    of Up:
      if pos[1] >= d:
        pos[1].dec
      else:
        pos[0].inc
        dir = Right
