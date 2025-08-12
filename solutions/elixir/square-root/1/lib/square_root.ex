defmodule SquareRoot do
  @tolerance 1.0e-10
  
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    guess = 
      if radicand == 0 do
        0.0
      else
        if radicand >= 1 do
          radicand / 2 
        else
          1
        end
      end
    newton(guess, radicand)
  end

  defp newton(x, n) do
    x_new = 0.5 * (x + n / x)
    # Base case: if the approximation converges
    x_returned = 
      if abs(x_new - x) < @tolerance do
        x_new
      else
        newton(x_new, n)
      end
    x_returned
  end

end
