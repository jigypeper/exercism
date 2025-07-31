defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  def egg_count(0), do: 0
  
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    remainder = rem(number, 2)
    quotient = div(number, 2)
    remainder + egg_count(quotient)
  end
end
