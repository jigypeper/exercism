module Darts (score) where

magnitude :: Float -> Float -> Float
magnitude x y = sqrt((x ** 2) + (y ** 2))

score :: Float -> Float -> Int
score x y 
  | mag > 10 = 0
  | mag > 5 = 1
  | mag > 1 = 5
  | otherwise = 10
  where mag = magnitude x y 
