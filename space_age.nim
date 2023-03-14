func age*(planet: string, secs: int64): float =
    let year: float = 31557600
    let factor = case planet:
        of "Mercury": 0.2408467
        of "Venus": 0.61519726
        of "Earth": 1.0
        of "Mars": 1.8808158
        of "Jupiter": 11.862615
        of "Saturn": 29.447498
        of "Uranus": 84.016846
        of "Neptune": 164.79132
        else: raise newException(ValueError, "Invalid planet")

    secs.float / year / factor