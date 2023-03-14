import std/strutils
import std/sequtils

const
  sharp = @["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
  flat  = @["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
  sharpMajor = @["G", "D", "A", "E", "B", "F#"]
  sharpMinor = @["e", "b", "f#", "c#", "g#", "d#"]

proc scale*(tonic: string, intervals: string): seq[string] =
  var base = flat

  if tonic in sharpMajor or tonic in sharpMinor or tonic == "a" or tonic == "C":
    base = sharp

  var idx = base.mapIt(it.toUpper).find(tonic.toUpper)

  if idx < 0:
    return

  for i in intervals:
    result.add base[idx]

    if i == 'M':
      idx.inc(2)
    elif i == 'A':
      idx.inc(3)
    else:
      idx.inc

    if idx > high(base):
      idx = idx-base.len

  result.add base[idx]