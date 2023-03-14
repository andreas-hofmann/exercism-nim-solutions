import std/sequtils
import std/algorithm

type
    Student* = tuple[name: string, grade: int]
    School* = object
        students*: seq[Student]

proc roster*(s: School): seq[string] =
    for st in s.students:
        result.add(st.name)

proc addStudent*(s: var School, name: string, grade: int) =
    if s.students.filterIt(it.name == name).len() != 0:
        raise new ValueError
    for i in 0..<s.students.len():
        let st = s.students[i]
        if st.grade == grade:
            if st.name > name:
                s.students.insert((name:name, grade:grade), i)
                return
        elif st.grade > grade:
            s.students.insert((name:name, grade:grade), i)
            return
    s.students.add((name:name, grade:grade))

proc grade*(s: School, grade: int): seq[string] =
    for st in s.students.filterIt(it.grade == grade):
        result.add(st.name)
