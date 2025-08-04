module Bob (responseFor) where
import Data.Char (isUpper, isSpace, isLetter)
import Data.List (dropWhileEnd)

responseFor :: String -> String
responseFor xs
  | xs == "" || all isSpace xs = "Fine. Be that way!"
  | any isLetter xs && all (\c -> not (isLetter c) || isUpper c) xs && elem '?' xs = "Calm down, I know what I'm doing!"
  | any isLetter xs && all (\c -> not (isLetter c) || isUpper c) xs = "Whoa, chill out!"
  | last (dropWhileEnd isSpace xs) == '?' = "Sure."
  | otherwise = "Whatever."
