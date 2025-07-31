defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    colors = Enum.take(colors, 3)
    {value_1, _} = color_value(List.first(colors))
    {value_2, _} = color_value(List.first(tl(colors)))
    {_, zeroes} = color_value(List.last(colors))

    number_value = List.to_integer(~c"#{value_1}#{value_2}#{zeroes}")
    length_of_num = String.length("#{number_value}")

    {val, unit} = case length_of_num do
      length_of_num when length_of_num in 1..3 -> {number_value, :ohms}
      length_of_num when length_of_num in 4..6 -> {div(number_value, 1000), :kiloohms}
      length_of_num when length_of_num in 7..9 -> {div(number_value, 1_000_000), :megaohms}
      length_of_num when length_of_num >= 10 -> {div(number_value, 1_000_000_000), :gigaohms}
    end
    
    {val, unit}
  end

  defp color_value(color) do
    case color do
      :black -> {0, ""}
      :brown -> {1, "0"}
      :red -> {2, "00"}
      :orange -> {3, "000"}
      :yellow -> {4, "0000"}
      :green -> {5, "00000"}
      :blue -> {6, "000000"}
      :violet -> {7, "0000000"}
      :grey ->{ 8, "00000000"}
      :white -> {9, "000000000"}
    end
  end
  
end
