defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    {_, map} = Map.pop(scores, name)
    map
  end

  def reset_score(scores, name) do
    add_player(scores, name)
  end

  def update_score(scores, name, score) do
    {_, new_scores} = Map.get_and_update(scores, name, fn 
      nil -> {nil, 0 + score} 
      current -> {current, current + score} end)
    new_scores
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
