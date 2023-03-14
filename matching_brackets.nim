func isPaired*(str: string): bool =
    var pairs = newSeq[char]()
    for c in str:
        case c:
        of '(', '[', '{':
            pairs.add(c)
        of ')':
            if pairs.len() == 0 or pairs.pop() != '(': return false
        of ']':
            if pairs.len() == 0 or pairs.pop() != '[': return false
        of '}':
            if pairs.len() == 0 or pairs.pop() != '{': return false
        else: continue
    return pairs.len() == 0
