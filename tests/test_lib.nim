import unittest, strutils
import expect

test "don't raise exceptions when assertion is valid":
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

test "raise exceptions when assertion is invalid":
  try:
    expectTrue(1 == 2)
    assert false
  except ExpectError:
    discard
  try:
    expectFalse(1 == 1)
    assert false
  except ExpectError:
    discard
  try:
    expectEqual(1, 2)
    assert false
  except ExpectError:
    discard
  try:
    expectNotEqual(1, 1)
    assert false
  except ExpectError:
    discard
  try:
    expectStringEqual(1, "2")
    assert false
  except ExpectError:
    discard
  try:
    expectStringNotEqual(1, "1")
    assert false
  except ExpectError:
    discard
  try:
    expectLessThan(2, 1)
    assert false
  except ExpectError:
    discard
  try:
    expectLessThanEqual(3, 2)
    assert false
  except ExpectError:
    discard
  try:
    expectGreaterThan(1, 2)
    assert false
  except ExpectError:
    discard
  try:
    expectGreaterThanEqual(1, 2)
    assert false
  except ExpectError:
    discard

test "assertions contain correct text":
  try:
    expectTrue(1 == 2)
  except ExpectError:
    let expected = """===== Expect Error =====
Left: false, right: true
Checked for: is true
========================
"""
    assert getCurrentExceptionMsg().strip() == expected.strip()
