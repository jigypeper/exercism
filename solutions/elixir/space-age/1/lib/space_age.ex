defmodule SpaceAge do
  @seconds_in_earth_year 31_557_600
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case planet do
      :mercury -> {:ok, (seconds/@seconds_in_earth_year) / 0.2408467}
      :venus -> {:ok, (seconds/@seconds_in_earth_year) / 0.61519726}
      :earth -> {:ok, (seconds/@seconds_in_earth_year)}
      :mars -> {:ok, (seconds/@seconds_in_earth_year) / 1.8808158}
      :jupiter -> {:ok, (seconds/@seconds_in_earth_year) / 11.862615}
      :saturn -> {:ok, (seconds/@seconds_in_earth_year) / 29.447498}
      :uranus -> {:ok, (seconds/@seconds_in_earth_year) / 84.016846}
      :neptune -> {:ok, (seconds/@seconds_in_earth_year) / 164.79132}
      _ -> {:error, "not a planet"}
    end
  end
end
