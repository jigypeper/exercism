module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just (go n)
  where
    go 1 = 0
    go k
      | even k    = 1 + go (k `div` 2)
      | otherwise = 1 + go (3*k + 1)
