defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    magnitude = ((x ** 2) + (y ** 2)) ** 0.5
    cond do
      magnitude > 10  -> 0
      magnitude > 5 -> 1
      magnitude > 1 -> 5
      true -> 10
    end
  end
end
