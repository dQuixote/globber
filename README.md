Rudyard Richter
CS 223, Exercise 10: Stanford Lab 1, Globber

Globber
-------

A simple globber function written in Haskell,
with tests using [hspec](http://hspec.github.io/).

You will write a simple function that performs [glob
matching](http://en.wikipedia.org/wiki/Glob_%28programming%29) Glob
matching is a simple form of pattern matching (i.e., regular
expressions but greatly reduced).

Usage
-----

    $ cabal sandbox init
    $ cabal install --only-dependencies --enable-tests
    $ cabal configure --enable-tests
    $ cabal build

Run tests with

    $ cabal test

Glob Matching
-------------

The glob matcher handles the following patterns:

* `'<char>'` matches a literal character
* `'?'` matches any single character.
* `'*'` matches any string including the empty string.
  explained below.
* `"\<char>"` matches a single literal character (including the special symbols).

Set matching is not supported.
