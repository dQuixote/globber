module Globber (matchGlob) where

import Data.List (subsequences, tails)

type GlobPattern = String

matchGlob :: GlobPattern -> String -> Bool
matchGlob [] []   = True
matchGlob [] _    = False
matchGlob "*" []  = True
matchGlob _ []    = False
matchGlob "?" [_] = True
matchGlob [x] [y] = x == y
matchGlob ('\\':x:xs) (y:ys) = x == y && matchGlob xs ys
matchGlob ('?':xs) (_:ys) = matchGlob xs ys
-- matchGlob ('[':xs) ys = matchSet xs ys
matchGlob ('*':xs) ys = any (matchGlob xs) (tails ys)
matchGlob (x:xs) (y:ys) = x == y && matchGlob xs ys

{-
 - prettier, but maybe slightly less clear
matchGlob glob str
    | null glob = null str
    | null str  = glob == "*"
    | glob == "?" = length str == 1
    | [x] <- glob
    , [y] <- str
    = x == y
matchGlob (x:xs) (y:ys) = case x of
    '\\' -> let x' = head xs
                xs' = tail xs
            in x' == y && matchGlob xs' ys
    '?'  -> matchGlob xs ys
    '*'  -> any (matchGlob xs) (tails (y:ys))
    x    -> x == y && matchGlob xs ys
 -}

{-
 - toying with set matching
matchSet :: GlobPattern -> String -> Bool
matchSet [] _ = False
matchSet _ [] = False
matchSet glob (y:ys) =
    if ']' `elem` glob
        then let (set, xs') = break (== ']') glob
                 xs = tail xs'
             in y `elem` set && matchGlob xs ys
        else error "unmatched set bracket"
 -}
