module ResistorColors (Color(..), value) where

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
  deriving (Eq, Show, Enum, Bounded)

value :: (Color, Color) -> Int
value (a, b) = 10 * colorToInt a + colorToInt b
  where
    colorToInt :: Color -> Int
    colorToInt Black   = 0
    colorToInt Brown   = 1
    colorToInt Red     = 2
    colorToInt Orange  = 3
    colorToInt Yellow  = 4
    colorToInt Green   = 5
    colorToInt Blue    = 6
    colorToInt Violet  = 7
    colorToInt Grey    = 8
    colorToInt White   = 9
    
