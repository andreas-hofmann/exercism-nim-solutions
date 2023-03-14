import std/strformat

type Clock = object
    minutes: int

const DAY = 24*60

proc toStr*(c: Clock): string =
    var min = c.minutes
    while min < 0:
        min.inc DAY
    while min >= DAY:
        min.dec DAY
    result = fmt"{min.div 60:02}:{min.mod 60:02}"

proc `==`*(l, r: Clock): bool =
    l.toStr == r.toStr

func create*(time: (int, int)): Clock =
    Clock(minutes: time[0]*60+time[1])

func add*(time: (int, int), m: int): Clock =
    result = Clock(minutes: time[0]*60+time[1])
    result.minutes.inc m

func subtract*(time: (int, int), m: int): Clock =
    result = Clock(minutes: time[0]*60+time[1])
    result.minutes.dec m