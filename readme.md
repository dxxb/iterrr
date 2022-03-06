# iterrr!
iterate faster ... 🏎️

## The Problem


## The Solution

## usage
use `><` for normal.
and `>!<` for debug mode.

## Concepts

**there are only 3 things in `iterrr`**:
1. **imap** :: like `mapIt` from `std/sequtils`
2. **ifilter** :: like `filterIt` from `std/sequtils`
3. **[reducer]**

**NOTE**: the prefix `i` is just a convention.

the default reducer is `iseq` with converts the result to a sequence of that type.

you can use other reducers, such as:
* `iseq` :: [the default reducer]
* `icount`
* `imin`
* `imax`
* `iany`
* `iall`
* `iHashSet`
* `iStrJoin`
* **[or your custom reducer!]**

### define a custom reducer
```nim
## example of custom reducer
```

## inspirations
1. [zero_functional](https://github.com/zero-functional/zero-functional)
2. [itertools](https://github.com/narimiran/itertools)
3. [slicerator](https://github.com/beef331/slicerator)
4. [Xflywind's comment on this issue](https://github.com/nim-lang/Nim/issues/18405#issuecomment-888391521)

## **iterrr** vs `zero_functional`:
`iterrr` targets the same problem as `zero_functional`, 
while being better at:
  1. extensibility
  2. using less meta programming
  3. compilation time

## **iterrr** vs `collect` from `std/suger`:
you can use `iterrr` instead of `collect`. 
you don't miss anything.

## is it a replacement for `itertools`?
not really, you can use them both together.
`itertools` has lots of useful iterators.

## Wanna Contribute?
**here are some suggestion:**

* add benchmark
  1. `iterrr` vs `std/sequtils` vs `zero_functional`
  2. compare to other languages like Rust, Go, Haskell, ...


## With Special Thanks To:
* [@beef331](https://github.com/beef331): who helped me a lot in my Nim journey

## Donate
you can send your donation to my [cryptocurrencies](https://github.com/hamidb80/hamidb80/#cryptocurrencies)