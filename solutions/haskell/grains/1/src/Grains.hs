module Grains (square, total) where

square :: Integer -> Maybe Integer
square n 
  | n <= 0    = Nothing
  | n > 64    = Nothing
  | otherwise = Just (go 1 1)
  where
    go x k
      | k >= n    = x
      | otherwise = go (2 * x) (k + 1)   

total :: Integer
total = sum (catMaybesList [square x | x <- [1..64]])
  where
    catMaybesList [] = []
    catMaybesList (Nothing : xs) = catMaybesList xs
    catMaybesList (Just x  : xs) = x : catMaybesList xs
  
      
    
