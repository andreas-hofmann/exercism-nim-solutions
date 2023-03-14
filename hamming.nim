proc distance*(A, B: string): int =
    if A.len() != B.len():
        raise new ValueError
    for i in 0..<A.len():
        if A[i] != B[i]:
            result += 1