import std/[algorithm, strutils]
func reverse*(s: string): string = s.reversed.join("")