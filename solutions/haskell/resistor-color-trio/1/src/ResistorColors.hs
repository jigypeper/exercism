module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded, Eq)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label r = show (reduceNum(ohms r)) <> " " <> unit
  where
    unit = case r of
      Resistor (_, _, n) | n ==Black || n ==Brown  -> "ohms"
      Resistor (Black, Black, n) | n ==Black || n ==Brown -> "ohms"
      Resistor (Black, Black, _) -> "ohms"
      Resistor (_, _, n) | n == Red || n == Orange || n == Yellow -> "kiloohms"
      Resistor (_, _, n) | n == Green || n == Blue || n == Violet -> "megaohms"
      _ -> "gigaohms"

ohms :: Resistor -> Int
ohms resistor = ((10 *  (convertColor first)) + (convertColor second)) * (10 ^ (convertColor third))
  where
    Resistor (first, second, third) = resistor

convertColor :: Color -> Int
convertColor color =
  case color of
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9

reduceNum :: Int -> Int
reduceNum num
  | (mod num 1000000000) == 0 = div num 1000000000
  | (mod num 1000000) == 0 = div num 1000000
  | (mod num 1000) == 0 = div num 1000
  | otherwise = num
