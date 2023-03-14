import std/tables
import std/random
import std/strformat

type Robot = object
    name*: string

var names = initCountTable[string]()

proc randChar(): char = chr rand(ord('Z')-ord('Z'))+ord('A')

proc makeRobot*(): Robot =
    while true:
        let name = fmt"{randChar()}{randChar()}{rand(999):03}"
        if not names.hasKey(name):
            names.inc name
            return Robot(name: name)

proc reset*(r: var Robot) =
    names.del(r.name)
    r = makeRobot()