module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right ""
toRNA (x:xs) = case convert x of
    Left err  -> Left err
    Right rna -> case toRNA xs of
        Left err' -> Left err'
        Right rest -> Right (rna : rest)
  where
    convert 'G' = Right 'C'
    convert 'C' = Right 'G'
    convert 'T' = Right 'A'
    convert 'A' = Right 'U'
    convert c   = Left c

  
