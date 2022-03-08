import std/[unittest, tables, strformat, sets, sequtils, strutils]
import iterrr


suite "chain generation":
  test "HSlice -> _":
    check (1..5 >< imap(it * it).ifilter(it > 10)) == @[16, 25]

  test "Table.pairs -> _":
    let
      t = newOrderedTable {"a": 1, "b": 2, "c": 3}
      res = t.pairs >< imap(fmt"{it[0]}: {it[1]}").iStrJoin(", ")

    check res == "a: 1, b: 2, c: 3"

  test "long chain":
    let res =
      [-2, -1, 0, 1, 2].items ><
        imap($it)
        .ifilter(it != "0")
        .ifilter('-' in it)
        .imap(parseInt it)

    check res == @[-2, -1]

suite "custom ident":
  test "== 1":
    check (1..10 >< ifilter[i](i < 5)) == @[1, 2, 3, 4]

  test "> 1":
    check (1..10 >< ifilter[i](i <= 5)) == toseq 1..5
    check ("hello".pairs >< imap[i, c](i + ord(c))) == @[104, 102, 110, 111, 115]

  test "long chain":
    let res = 1..30 ><
      imap[n]($n)
      .ifilter[s](s.len == 1)
      .imap[s](parseInt s)

    check res == toseq 1..9

suite "inplace reducer":
  var acc: string
  1..10 >< ifilter(it in 3..5).imap($(it+1)).do(num):
    acc &= num
  
  check acc == "456"

suite "reducers":
  let
    emptyIntList = newseq[int]()
    emptyBoolList = newseq[bool]()

  test "icount":
    check (1..20 >< icount()) == 20

  test "imin":
    doAssertRaises RangeDefect:
      discard emptyIntList.items >< imin()

    check [2, 1, 3].items >< imin() == 1

  test "imax":
    doAssertRaises RangeDefect:
      discard emptyIntList.items >< imax()

    check [2, 1, 3].items >< imax() == 3

  test "iany":
    check:
      emptyBoolList.items >< iany() == false
      [false, false, false].items >< iany() == false
      [true, false, false].items >< iany() == true

  test "iall":
    check:
      emptyBoolList.items >< iall() == true
      [false, true, true].items >< iall() == false
      [true, true, true].items >< iall() == true

  test "istrJoin":
    check (1..4 >< iStrJoin(";")) == "1;2;3;4"

  test "iHashSet":
    check (-5..5 >< imap(abs it).iHashSet()) == toHashSet toseq 0..5
