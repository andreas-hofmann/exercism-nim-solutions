import std/times
import std/strformat

type Descriptor* = enum Teenth, First, Second, Third, Fourth, Last

proc meetup*(year, month: int, desc: Descriptor, day: Weekday): string =
    let startstr = fmt"{year}-{month}"
    var date = parse(startstr, "yyyy-M")
    var i = 0
    while true:
        if date.weekday == day:
            if desc == Last:
                let lastday = getDaysInMonth(Month month, year)
                if date.monthday() in lastday-6..lastday:
                    return date.getDateStr()
            elif desc == Teenth:
                if date.monthday() in 13..19:
                    return date.getDateStr()
            else:
                inc i
                if i == Last.int:
                    i = int First
                if i.Descriptor == desc:
                    return date.getDateStr()
        date += 1.days