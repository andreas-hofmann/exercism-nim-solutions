type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    val: int
    oldVal: int
    callbacks: seq[Callback]
    deps: seq[Cell]
    compute: ComputeFunc

proc value*(cell: Cell): int =
  if cell.compute != nil:
    var values = newSeq[int]()

    for d in cell.deps:
      values.add d.value

    cell.val = cell.compute(values)
    if cell.val != cell.oldVal:
      cell.oldVal = cell.val

  cell.val

proc `value=`*(cell: Cell, val: int) =
  if cell.compute != nil:
    return

  if val == cell.val:
    return

  cell.val = val

  for cb in cell.callbacks:
    cb(val)

proc addCallback*(cell: Cell, callback: Callback) =
  cell.callbacks.add callback

proc removeCallback*(cell: Cell, callback: Callback) =
  let idx = cell.callbacks.find callback
  if idx >= 0:
    cell.callbacks.del idx

proc newInputCell*(val: int): Cell =
  Cell(
    val: val,
    oldVal: val,
    callbacks: newSeq[Callback](),
    deps: newSeq[Cell](),
    compute: nil,
  )

proc update(cell: Cell, fireCallbacks: bool = false) =
  var depValues = newSeq[int]()

  for d in cell.deps:
    depValues.add d.value

  cell.val = cell.compute(depValues)

  if cell.val != cell.oldVal:
    for cb in cell.callbacks:
      cb(cell.val)
    cell.oldVal = cell.val

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  var cell = Cell(
    deps: dependencies,
    compute: compute,
  )

  for d in cell.deps:
    d.addCallback proc(x: int) = cell.update(fireCallbacks=true)

  cell.update(fireCallbacks=false)

  return cell