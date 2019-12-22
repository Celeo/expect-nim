import strformat

type
  ExpectAssertionError* = object of Exception

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
  let b = true
  if a != b:
    raise newException(ExpectAssertionError, message(etTrue, a, true))

proc expectFalse*(a: bool) =
  let b = false
  if a != b:
    raise newException(ExpectAssertionError, message(etFalse, a, false))

proc expectEqual*(a, b: auto) =
  if a != b:
    raise newException(ExpectAssertionError, message(etEqual, a, b))

proc expectNotEqual*(a, b: auto) =
  if a == b:
    raise newException(ExpectAssertionError, message(etNotEqual, a, b))

proc expectStringEqual*(a, b: auto) =
  if $a != $b:
    raise newException(ExpectAssertionError, message(etStringEqual, $a, $b))

proc expectStringNotEqual*(a, b: auto) =
  if $a == $b:
    raise newException(ExpectAssertionError, message(etStringNotEqual, $a, $b))

proc expectLessThan*(a, b: SomeNumber) =
  if a >= b:
    raise newException(ExpectAssertionError, message(etLessThan, a, b))

proc expectLessThanEqual*(a, b: SomeNumber) =
  if a > b:
    raise newException(ExpectAssertionError, message(etLessThanEqual, a, b))

proc expectGreaterThan*(a, b: SomeNumber) =
  if a <= b:
    raise newException(ExpectAssertionError, message(etGreaterThan, a, b))

proc expectGreaterThanEqual*(a, b: SomeNumber) =
  if a < b:
    raise newException(ExpectAssertionError, message(etGreaterThanEqual, a, b))
