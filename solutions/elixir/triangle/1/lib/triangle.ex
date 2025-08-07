defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    cond do
      a <= 0 or b <= 0 or c <= 0 -> {:error, "all side lengths must be positive" }
      a + b < c or a + c < b or b + c < a -> {:error, "side lengths violate triangle inequality"}
      a == b and b == c and a != 0 -> {:ok, :equilateral}
      length(MapSet.to_list(MapSet.new([a,b,c]))) == 2 -> {:ok, :isosceles}
      length(MapSet.to_list(MapSet.new([a,b,c]))) == 3 -> {:ok, :scalene}
      
    end
  end
end
