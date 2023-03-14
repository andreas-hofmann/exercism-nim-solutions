import std/strformat

type
  LinkedList*[T] = object ## A doubly linked list.
    head: LinkedListEntry[T]
    tail: LinkedListEntry[T]
    length: int

  LinkedListEntry[T] = ref object
    prev: LinkedListEntry[T]
    next: LinkedListEntry[T]
    data: T


proc doDelete*[T](list: var LinkedList[T], node: LinkedListEntry[T]): T =
    if node == nil:
      return

    if node.prev == nil:
        list.head = node.next
    else:
      if node.next != nil:
        node.prev.next = node.next
      else:
        node.prev.next = nil

    if node.next == nil:
        list.tail = node.prev
    else:
      if node.prev != nil:
        node.next.prev = node.prev
      else:
        node.next.prev = nil

    dec list.length
    node.data


proc findFirst[T](list: LinkedList[T], val: T): LinkedListEntry[T] =
  var entry = list.head

  while entry != nil:
    if entry.data == val:
      return entry
    entry = entry.next

  return nil


proc len*[T](list: LinkedList[T]): int =
  list.length


proc push*[T](list: var LinkedList[T], val: T) =
  var n = LinkedListEntry[T](
    data: val,
    prev: list.tail,
    next: nil
  )

  if list.tail != nil:
    list.tail.next = n

  list.tail = n
  inc list.length

  if list.head == nil:
    list.head = n


proc unshift*[T](list: var LinkedList[T], val: T) =
  var n = LinkedListEntry[T](
    data: val,
    next: list.head,
    prev: nil,
  )

  if list.head != nil:
    list.head.prev = n

  list.head = n
  inc list.length

  if list.tail == nil:
    list.tail = n


proc pop*[T](list: var LinkedList[T]): T =
  list.doDelete(list.tail)


proc shift*[T](list: var LinkedList[T]): T =
  list.doDelete(list.head)


proc delete*[T](list: var LinkedList[T], val: T) =
  var entry = list.findFirst(val)
  discard list.doDelete(entry)