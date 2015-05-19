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
matchGlob ('*':xs) ys = any (matchGlob xs) (tails ys)
matchGlob (x:xs) (y:ys) = x == y && matchGlob xs ys
