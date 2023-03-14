proc toRna*(dna: string): string =
    for c in dna:
        result.add case c:
                    of 'G': "C"
                    of 'C': "G"
                    of 'T': "A"
                    of 'A': "U"
                    else: raise newException(ValueError, "Invalid char")