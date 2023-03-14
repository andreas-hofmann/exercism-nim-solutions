proc saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  for r in matrix.low..matrix.high:
    for c in matrix[0].low..matrix[0].high:
      var is_saddle = true

      for y in matrix.low..matrix.high:
        if matrix[y][c] < matrix[r][c]:
          is_saddle = false
          break

      for x in matrix[0].low..matrix[0].high:
        if matrix[r][x] > matrix[r][c]:
          is_saddle = false
          break

      if is_saddle:
        result.add (r+1, c+1)
