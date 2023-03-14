import std/times
proc addGigasecond*(t: DateTime): DateTime = t + initTimeInterval(seconds = 1_000_000_000)