import std/tables
import std/sequtils

proc countDna*(dna: string): CountTable[char] =
    if dna.anyIt(it notin "AGCT"):
        raise newException(ValueError, "Invalid input")
    dna.toCountTable()