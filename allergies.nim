type
    Allergies* = object
        score*: int
    Allergy = enum
        eggs = 1 shl 0,
        peanuts = 1 shl 1,
        shellfish = 1 shl 2,
        strawberries = 1 shl 3,
        tomatoes = 1 shl 4,
        chocolate = 1 shl 5,
        pollen = 1 shl 6,
        cats = 1 shl 7

proc `and`(score: int, a: Allergy): bool =
    return 0 != (score and ord(a))

proc `and`(self: Allergies, a: Allergy): bool =
    return 0 != (self.score and ord(a))

proc lst*(self: Allergies): seq[string] =
    if self and eggs: result.add("eggs")
    if self and peanuts: result.add("peanuts")
    if self and shellfish: result.add("shellfish")
    if self and strawberries: result.add("strawberries")
    if self and tomatoes: result.add("tomatoes")
    if self and chocolate: result.add("chocolate")
    if self and pollen: result.add("pollen")
    if self and cats: result.add("cats")


proc isAllergicTo*(self: Allergies, thing: string): bool =
    case thing
    of "eggs": return self and eggs
    of "peanuts": return self and peanuts
    of "shellfish": return self and shellfish
    of "strawberries": return self and strawberries
    of "tomatoes": return self and tomatoes
    of "chocolate": return self and chocolate
    of "pollen": return self and pollen
    of "cats": return self and cats

    return false
