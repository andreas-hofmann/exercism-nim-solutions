import std/algorithm
import std/bitops

proc commands*(n: int): seq[string] =
  if n.testBit(0): result.add "wink"
  if n.testBit(1): result.add "double blink"
  if n.testBit(2): result.add "close your eyes"
  if n.testBit(3): result.add "jump"
  if n.testBit(4): result.reverse