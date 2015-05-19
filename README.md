Rudyard Richter

CS 223, Exercise 10: Stanford Lab 1, Globber

Globber
-------

A simple globber function written in Haskell,
with tests using [hspec](http://hspec.github.io/).


Usage
-----

Setting up a cabal sandbox to run it in:

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
