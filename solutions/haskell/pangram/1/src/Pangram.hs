module Pangram (isPangram) where
import Data.Char (toLower) 


isPangram :: String -> Bool
isPangram text = 
  if length ([letter | letter <- ['a'..'z'], not (elem letter (map toLower text))]) == 0 
  then 
    True 
  else 
    False
