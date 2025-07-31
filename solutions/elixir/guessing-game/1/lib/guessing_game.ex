defmodule GuessingGame do
  def compare(secret_number) do
    "Make a guess"
  end

  def compare(secret_number, :no_guess) do
    "Make a guess"
  end
  
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end

  def compare(secret_number, guess) do
    variance = secret_number - guess
    cond do
      variance == 1 or variance == -1 -> "So close"
      secret_number > guess -> "Too low"
      secret_number < guess -> "Too high"
    end
  end
  
end
