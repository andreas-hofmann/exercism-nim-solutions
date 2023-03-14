import std/tables
import std/strutils
import std/sequtils

proc countWords*(input: string): CountTable[string] =
    result = input
                .splitWhitespace()
                .mapIt(it.split(','))
                .foldl(a & b)
                .mapIt(it.strip(chars = {'\'', '&', '!', '@', '$', '%', '^', '\n', ':', '.'}))
                .mapIt(it.toLower())
                .toCountTable()
    result.del("")
    result.del("\n")