module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper, isLower)

splitOnLowerToUpper :: String -> String
splitOnLowerToUpper [] = []
splitOnLowerToUpper (x:xs) = x : go x xs
  where
    go _ [] = []
    go prev (c:cs)
      | isLower prev && isUpper c = ' ':c : go c cs
      | otherwise                 =   c   : go c cs

specialsToSpace :: String -> String
specialsToSpace = map (\c -> if c `elem` "-_" then ' ' else c)

sanitizeStr :: String -> String
sanitizeStr str = splitOnLowerToUpper (specialsToSpace str)

abbreviate :: String -> String
abbreviate xs = [toUpper (head x) | x <- (words (sanitizeStr xs))]
