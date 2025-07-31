defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, x} = volume_pair
    x
  end

  def to_milliliter({:milliliter, x} = _volume_pair) do
    {:milliliter, x}
  end

  def to_milliliter({:cup, x} = _volume_pair) do
    {:milliliter, x * 240}
  end

  def to_milliliter({:fluid_ounce, x} = _volume_pair) do
    {:milliliter, x * 30}
  end

  def to_milliliter({:teaspoon, x} = _volume_pair) do
    {:milliliter, x * 5}
  end

  def to_milliliter({:tablespoon, x} = _volume_pair) do
    {:milliliter, x * 15}
  end

  def from_milliliter({_, amount} = _volume_pair, x = _unit) do
    case x do
      :cup -> {:cup, amount / 240}
      :fluid_ounce -> {:fluid_ounce, amount / 30}
      :teaspoon -> {:teaspoon, amount / 5}
      :tablespoon -> {:tablespoon, amount / 15}
      :milliliter -> {:milliliter, amount}
    end
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
