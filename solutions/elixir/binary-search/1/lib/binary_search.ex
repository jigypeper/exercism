defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found

  def search(), do: :not_found

  def search({x}, x), do: {:ok, 0}

  def search(numbers, key) do
    do_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp do_search(_numbers, _key, low, high) when low > high, do: :not_found

  defp do_search(numbers, key, low, high) do
    mid = div(low + high, 2)
    current = elem(numbers, mid)

    cond do
      current == key -> {:ok, mid}
      current < key -> do_search(numbers, key, mid + 1, high)
      current > key -> do_search(numbers, key, low, mid - 1)
    end
  end
end
