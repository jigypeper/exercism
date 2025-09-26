module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

factors num = [x | x <- [1..num], mod num x == 0, x /= num]

classify :: Int -> Maybe Classification
classify num = check $ sum (factors num)
    where
        check result
            | num <= 0 = Nothing 
            | result == num = Just Perfect
            | result > num = Just Abundant
            | otherwise = Just Deficient
