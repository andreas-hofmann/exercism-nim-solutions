import std/strutils

type Plant* = enum Radishes, Clover, Grass, Violets

let kids = ["Alice", "Bob", "Charlie", "David",
            "Eve", "Fred", "Ginny", "Harriet",
            "Ileana", "Joseph", "Kincaid", "Larry"]

func plant(p: char): Plant =
    case p:
    of 'R': Plant.Radishes
    of 'C': Plant.Clover
    of 'V': Plant.Violets
    of 'G': Plant.Grass
    else: raise newException(ValueError, "Invalid plant")

proc plants*(garden, kid: string): seq[Plant] =
    let
        pos = kids.find(kid)*2
        g = garden.splitLines()
    result.add(g[0][pos].plant)
    result.add(g[0][pos+1].plant)
    result.add(g[1][pos].plant)
    result.add(g[1][pos+1].plant)