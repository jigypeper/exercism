module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year 
    | (mod year 400) == 0 = True
    | (year `mod` 4) == 0 && (mod year 100) == 0  = False
    | (year `mod` 4) == 0 = True    
    | otherwise = False
    
