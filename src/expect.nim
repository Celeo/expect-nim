import strformat

type
  ExpectError* = object of Exception

  ExpectType = enum
    etTrue = "is true"
    etFalse = "is false"
    etEqual = "equal"
    etNotEqual = "not equal"
    etStringEqual = "string equal"
    etStringNotEqual = "string not equal"
    etLessThan = "less than"
    etLessThanEqual = "less than or equal"
    etGreaterThan = "greater than"
    etGreaterThanEqual = "greater than or equal"

proc message(t: ExpectType, a: auto, b: auto): string =
  &"\n===== Expect Error =====\nLeft: {a}, right: {b}\nChecked for: {t}\n========================\n"

proc expectTrue*(a: bool) =
  ## Assert that the passed value is true.
  ##
  ## An `ExpectError` is raised if this is false.
  let b = true
  if a != b:
    raise newException(ExpectError, message(etTrue, a, true))

proc expectFalse*(a: bool) =
  ## Assert that the passed value is false.
  ##
  ## An `ExpectError` is raised if this is false.
  let b = false
  if a != b:
    raise newException(ExpectError, message(etFalse, a, false))

proc expectEqual*(a, b: auto) =
  ## Assert that both values are equal.
  ##
  ## An `ExpectError` is raised if this is false.
  if a != b:
    raise newException(ExpectError, message(etEqual, a, b))

proc expectNotEqual*(a, b: auto) =
  ## Assert that the values are not equal.
  ##
  ## An `ExpectError` is raised if this is false.
  if a == b:
    raise newException(ExpectError, message(etNotEqual, a, b))

proc expectStringEqual*(a, b: auto) =
  ## Assert that the string representations of the values are equal.
  ##
  ## An `ExpectError` is raised if this is false.
  if $a != $b:
    raise newException(ExpectError, message(etStringEqual, $a, $b))

proc expectStringNotEqual*(a, b: auto) =
  ## Assert that the string representations of the values are not equal.
  ##
  ## An `ExpectError` is raised if this is false.
  if $a == $b:
    raise newException(ExpectError, message(etStringNotEqual, $a, $b))

proc expectLessThan*(a, b: SomeNumber) =
  ## Assert that the second value is less than the first.
  ##
  ## An `ExpectError` is raised if this is false.
  if a >= b:
    raise newException(ExpectError, message(etLessThan, a, b))

proc expectLessThanEqual*(a, b: SomeNumber) =
  ## Assert that the second value is less than or equal to the first.
  ##
  ## An `ExpectError` is raised if this is false.
  if a > b:
    raise newException(ExpectError, message(etLessThanEqual, a, b))

proc expectGreaterThan*(a, b: SomeNumber) =
  ## Assert that the second value is greater than the first.
  ##
  ## An `ExpectError` is raised if this is false.
  if a <= b:
    raise newException(ExpectError, message(etGreaterThan, a, b))

proc expectGreaterThanEqual*(a, b: SomeNumber) =
  ## Assert that the second value is greater than or equal to the first.
  ##
  ## An `ExpectError` is raised if this is false.
  if a < b:
    raise newException(ExpectError, message(etGreaterThanEqual, a, b))
