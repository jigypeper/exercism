module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds =
  case planet of
    Mercury -> (seconds/earth_year_secs) / 0.2408467
    Venus -> (seconds/earth_year_secs) / 0.61519726
    Earth -> (seconds/earth_year_secs) / 1.0
    Mars -> (seconds/earth_year_secs) / 1.8808158
    Jupiter -> (seconds/earth_year_secs) / 11.862615
    Saturn -> (seconds/earth_year_secs) / 29.447498
    Uranus -> (seconds/earth_year_secs) / 84.016846
    Neptune -> (seconds/earth_year_secs) / 164.79132
  where earth_year_secs = 31557600
    
