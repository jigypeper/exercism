module Phone (number) where
import Data.Char


number :: String -> Maybe String
number input
  = case cleanDigits input of
      []           -> Nothing
      ds | length ds == 10                   -> validateAreaAndExchange ds
         | length ds == 11 && head ds == '1' -> validateAreaAndExchange (tail ds)
         | otherwise                         -> Nothing
  where
    cleanDigits = filter isDigit
    validateAreaAndExchange ds'
      | length ds' == 10
        , let areaCodeFirst = ds' !! 0
        , let exchangeFirst = ds' !! 3
        , areaCodeFirst `elem` "23456789"
        , exchangeFirst `elem` "23456789"
        = Just ds'
      | otherwise
        = Nothing
      
