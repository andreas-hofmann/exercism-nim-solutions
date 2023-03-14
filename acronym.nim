import std/strutils

proc abbreviate*(input: string): string =
    for word in input.replace("-", " ").replace("_", " ").splitWhitespace():
        result.add(word[0].toUpperAscii())