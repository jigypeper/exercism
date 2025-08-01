defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    name = IO.gets("What is your character's name?\n")
    name
    |> String.trim()
    |> String.strip()
  end

  def ask_class() do
    class = IO.gets("What is your character's class?\n")
    class
    |> String.trim()
    |> String.strip()
  end

  def ask_level() do
    level = IO.gets("What is your character's level?\n")
    level
    |> String.trim()
    |> String.strip()
    |> String.to_integer()
  end

  def run() do
    _welcome = welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    char = %{class: class, level: level, name: name}
    IO.inspect(char, label: "Your character")
  end
end
