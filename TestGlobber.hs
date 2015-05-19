module Main (main) where

import Test.Hspec
import Globber

main :: IO ()
main = hspec $ describe "Testing Globber" $ do

    describe "empty pattern" $ do
        it "matches empty string" $
            matchGlob "" "" `shouldBe` True
        it "shouldn't match non-empty string" $
            matchGlob "" "string" `shouldBe` False

    describe "character matching" $ do
        it "should match literal characters" $
            matchGlob "a" "a" `shouldBe` True
        it "should match longer strings" $
            matchGlob "~!@#$%^&" "~!@#$%^&" `shouldBe` True

    describe "question mark cases" $ do
        it "matches any single character" $
            matchGlob "?" "*" `shouldBe` True
        it "matches any character within a longer string" $
            matchGlob "?s" "xs" `shouldBe` True

    describe "star cases" $ do
        it "matches any other string" $
            matchGlob "*" "quick brown fox" `shouldBe` True
        it "matches beginning substrings" $
            matchGlob "*.hs" "test.hs" `shouldBe` True
        it "does not match beginning substrings incorrectly" $ do
            matchGlob "*.txt" "test.hs" `shouldBe` False
            matchGlob "*.txt" "a.txt.pdf" `shouldBe` False
        it "matches ending substrings" $
            matchGlob "alpha*" "alpha beta" `shouldBe` True
        it "matches beginning and ending to beginning" $
            matchGlob "*fox*" "brown fox" `shouldBe` True
        it "matches at beginning and ending to ending" $
            matchGlob "*fox*" "fox jumps" `shouldBe` True
        it "matches at beginning and ending to both" $
            matchGlob "*fox*" "brown fox jumps" `shouldBe` True

    describe "escaped literals" $ do
        it "matches an escaped literal character" $
            matchGlob "\\*" "*" `shouldBe` True
        it "matches escaped literal characters in a longer string" $ do
            matchGlob "a\\?b\\[c\\]" "a?b[c]" `shouldBe` True
            matchGlob "abcd\\e" "abcde" `shouldBe` True

    {-
     - toying with set matching
    describe "set matches" $ do
        it "should match single characters in a set" $ do
            matchGlob "[012]" "1" `shouldBe` True
            matchGlob "[012]" "3" `shouldBe` False
        it "should match sets in a longer string" $
            matchGlob "abc[123]" "abc3" `shouldBe` True
        it "should not match characters not in a set" $
            matchGlob "abc[123]" "abc4" `shouldBe` False
     -}
