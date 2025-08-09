defmodule RationalNumbers do
  import Kernel, except: [abs: 1]
  @type rational :: {integer, integer}
  @epsilon 1.0e-8
 
  @spec gcd(a :: rational) :: integer
  defp gcd({a, 0}), do: abs_val(a)
  defp gcd({numerator, denominator}) do
    gcd({denominator, Integer.mod(numerator, denominator)})
  end

  defp abs_val(number) do
    if number < 0, do: -number, else: number
  end

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {numerator_a, denominator_a} = a
    {numerator_b, denominator_b} = b
    cond do
      denominator_a == denominator_b ->
        num = numerator_a + numerator_b
        denom = denominator_a
        gcf = gcd({num, denom})
        {div(num, gcf), div(denom, gcf)}
      denominator_a != denominator_b ->
        new_denom = denominator_a * denominator_b
        new_nume = (numerator_a * denominator_b) + (numerator_b * denominator_a)
        gcf = gcd({new_nume, new_denom})
        {div(new_nume, gcf), div(new_denom, gcf)}
    end
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {numerator_a, denominator_a} = a
    {numerator_b, denominator_b} = b
    cond do
      denominator_a == denominator_b ->
        num = numerator_a - numerator_b
        denom = denominator_a
        gcf = gcd({num, denom})
        {div(num, gcf), div(denom, gcf)}
      denominator_a != denominator_b ->
        new_denom = denominator_a * denominator_b
        new_nume = (numerator_a * denominator_b) - (numerator_b * denominator_a)
        gcf = gcd({new_nume, new_denom})
        {div(new_nume, gcf), div(new_denom, gcf)}
    end
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {numerator_a, denominator_a} = a
    {numerator_b, denominator_b} = b
    new_denom = denominator_a * denominator_b
    new_nume = numerator_a * numerator_b
    gcf = gcd({new_nume, new_denom})
    {div(new_nume, gcf), div(new_denom, gcf)}
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {numerator_a, denominator_a} = num
    {numerator_b, denominator_b} = den
    new_denom = denominator_a * numerator_b
    new_nume = numerator_a * denominator_b
    gcf = gcd({new_nume, new_denom})
    result = {div(new_nume, gcf), div(new_denom, gcf)}
    reduce(result)
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {numerator_a, denominator_a} = a
    result = {abs_val(numerator_a), abs_val(denominator_a)}
    reduce(result)
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {numerator_a, denominator_a} = a
    cond do
      n == 0 -> {1, 1}
      n > 0 -> 
        result = {Integer.pow(numerator_a, n), Integer.pow(denominator_a, n)}
        reduce(result)
      n < 0 -> 
        pos_n = -n
        result = {Integer.pow(denominator_a, pos_n), Integer.pow(numerator_a, pos_n)}
        reduce(result)
    end
  end

  @doc """
  Nth Root using the Newton-Raphson method
  """
  def nth_root(x, n) when x >= 0 and n > 0 do
    guess = if x == 0 do
      0.0
    else
      min(x, 1.0 + x / n)
    end
    nth_root(x, n, guess)
  end

  defp nth_root(x, n, guess) do
    n_minus_one = n - 1
    x_div_guess_pow = x / :math.pow(guess, n_minus_one)
    new_guess = (n_minus_one * guess + x_div_guess_pow) / n
    if abs_val(guess - new_guess) < @epsilon do
      new_guess
    else
      nth_root(x, n, new_guess)
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {nume, denom} = n
    if x < 0 and rem(denom, 2) == 0 do
      raise ArgumentError, message: "Cannot take even root of negative number"
    else
      :math.pow(nth_root(abs_val(x), denom), nume)
    end
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {nume, denom} = a
    gcf = gcd({nume, denom})
    reduced_nume = div(nume, gcf)
    reduced_denom = div(denom, gcf)
    
    # Normalize sign: denominator should be positive
    if reduced_denom < 0 do
      {-reduced_nume, -reduced_denom}
    else
      {reduced_nume, reduced_denom}
    end
  end
end