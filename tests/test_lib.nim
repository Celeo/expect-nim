import unittest
import expect

test "expects":
  expectTrue(1 == 1)
  expectFalse(1 == 2)
  expectEqual(1, 1)
  expectNotEqual(1, 2)
  expectStringEqual(1, "1")
  expectStringNotEqual(1, "2")
  expectLessThan(1, 2)
  expectLessThanEqual(1, 1)
  expectLessThanEqual(1, 2)
  expectGreaterThan(2, 1)
  expectGreaterThanEqual(1, 1)
  expectGreaterThanEqual(2, 1)
  expectGreaterThanEqual(2, 1)
