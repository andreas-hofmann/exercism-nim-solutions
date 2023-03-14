import std/random
import std/algorithm
import std/math

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc ability*: int =
  var throws = newSeq[int]()
  for i in 0..3:
    throws.add 1+rand(5)
  throws = throws.sorted[1..throws.high]
  return throws.sum

proc modifier*(n: int): int = return ((n-10)/2).floor.int

proc initCharacter*: Character =
  randomize()
  result = Character(
    strength: ability(),
    dexterity: ability(),
    constitution: ability(),
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
  )
  result.hitpoints = 10+modifier(result.constitution)