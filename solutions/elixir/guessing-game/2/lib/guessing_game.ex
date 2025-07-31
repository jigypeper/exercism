defmodule GuessingGame do

  def compare(_secret_number) do
      "Make a guess"
  end

  def compare(secret_number, guess \\ :no_guess) do
    case guess do
      :no_guess -> "Make a guess"
      _ -> 
        variance = secret_number - guess
        cond do
          secret_number == guess -> "Correct"
          variance == 1 or variance == -1 -> "So close"
          secret_number > guess -> "Too low"
          secret_number < guess -> "Too high"
        end
    end
  end
  
end
