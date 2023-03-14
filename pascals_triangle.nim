import std/sequtils
proc pascal*(nr: int): seq[seq[int]] =
    for i in 0 .. nr-1:
        result.add newSeqWith(1+i, 1)

        if i == 0:
            continue

        for j in 0 .. result[i-1].len-2:
            result[i][j+1] = result[i-1][j] + result[i-1][j+1]