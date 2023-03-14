import std/strutils

proc hey*(input2: string): string =
    let input = input2.strip()
    if input.endsWith("?"):
        if Letters in input and input == input.toUpper():
            return "Calm down, I know what I'm doing!"
        else:
            return "Sure."

    if Letters in input and input == input.toUpper():
        return "Whoa, chill out!"

    if input.len == 0:
        return "Fine. Be that way!"

    return "Whatever."