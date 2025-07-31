defmodule HighScore do
  @score 0
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @score) do
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
    Map.update(scores, name, 0 + score, fn 
      current -> current + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
