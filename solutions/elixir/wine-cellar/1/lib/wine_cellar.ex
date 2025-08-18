defmodule WineCellar do
  def explain_colors do
    [
    white: "Fermented without skin contact.",
    red: "Fermented with skin contact using dark-colored grapes.",
    rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    case opts do
      year: x ->
        Enum.filter(cellar, fn {existing_color, _info} -> existing_color == color end)
        |> Enum.map(fn {_color, info} -> info end)
        |> Enum.filter(fn {_name, year, _country} -> year == x end)
      country: x ->
        Enum.filter(cellar, fn {existing_color, _info} -> existing_color == color end)
        |> Enum.map(fn {_color, info} -> info end)
        |> Enum.filter(fn {_name, _year, country} -> country == x end)
      year: x, country: y ->
        Enum.filter(cellar, fn {existing_color, _info} -> existing_color == color end)
        |> Enum.map(fn {_color, info} -> info end)
        |> Enum.filter(fn {_name, year, country} -> year == x and country == y end)
      country: x, year: y ->
        Enum.filter(cellar, fn {existing_color, _info} -> existing_color == color end)
        |> Enum.map(fn {_color, info} -> info end)
        |> Enum.filter(fn {_name, year, country} -> country == x and year == y end)
      _ -> 
        Enum.filter(cellar, fn {existing_color, _info} -> existing_color == color end)
        |> Enum.map(fn {_color, info} -> info end)
    end
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
