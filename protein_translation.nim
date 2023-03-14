import std/sequtils
import std/strutils

proc translate*(dnaInput: string): seq[string] =
    var dna = dnaInput
    while true:
        if dna.len == 0: return result
        if dna.len < 3: raise newException(ValueError, "Incomplete seqence")
        let codon = dna[0..2]
        dna = dna[3..^1]
        result.add case codon:
            of "AUG": "Methionine"
            of "UUU", "UUC": "Phenylalanine"
            of "UUA", "UUG": "Leucine"
            of "UCU", "UCC", "UCA", "UCG": "Serine"
            of "UAU", "UAC": "Tyrosine"
            of "UGU", "UGC": "Cysteine"
            of "UGG": "Tryptophan"
            of "UAA", "UAG", "UGA": return result # STOP
            else: raise newException(ValueError, "Invalid codon")