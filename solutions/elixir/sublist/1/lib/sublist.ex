defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      a == [] -> :sublist
      b == [] -> :superlist
      :true -> check(a, b)
      
    end
  end

  defp check(a, b) do 
    a_length = length(a)
    b_length = length(b)
    
    result = if a_length < b_length do
      windowed = Enum.chunk_every(b, a_length, 1, :discard)
      Enum.member?(windowed, a)
    else
      windowed = Enum.chunk_every(a, b_length, 1, :discard)
      Enum.member?(windowed, b)
    end
    
    case result do
      :false -> :unequal
      :true ->
        if a_length > b_length do
          :superlist
        else
          :sublist
        end
    end
  end
end
