import std/math
import std/random

proc privateKey*(p: int): int =
    rand(2..<p).int

proc publicKey*(p, g, pk: int): int =
    g.float.pow(pk.float).int mod p

proc secret*(p, theirPubKey, myPrivKey: int): int =
    theirPubKey.float.pow(myPrivKey.float).int mod p