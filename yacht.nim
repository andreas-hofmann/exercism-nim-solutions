import std/[sequtils, math, algorithm, tables]

type
  Category* = enum
    Ones, Twos, Threes, Fours, Fives, Sixes,
    FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

proc score*(dice: array[5, int], category: Category): int =
  case category:
  of Ones..Sixes:
    result = dice.filterIt(it == ord(category)+1).sum
  of FullHouse:
    let ct = dice.toCountTable
    if ct.len == 2 and ct.smallest.val == 2: result = dice.sum
  of FourOfAKind:
    let d = dice.sorted.toCountTable.largest
    if d.val >= 4: result = 4 * d.key
  of LittleStraight:
    if dice.sorted == @[1,2,3,4,5]: result = 30
  of BigStraight:
    if dice.sorted == @[2,3,4,5,6]: result = 30
  of Choice:
    result = dice.sum
  of Yacht:
    if dice.toCountTable.len == 1: result = 50