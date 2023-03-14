proc recite*(words: seq[string]): string =
    if words.len > 1:
        for i in 0 .. words.len-2:
            result.add "For want of a " & words[i] & " the " & words[i+1] & " was lost.\n"
    if words.len > 0:
        result.add "And all for the want of a " & words[0] & "."